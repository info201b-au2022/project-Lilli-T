# Chart 1
survey <- read.csv("../data/human_response_data.csv")
library(tidyverse)
library(styler)

# General health vs actions when poor AQI
# Question 8 (categorical) vs Question 29 (categorical)
get_health_action <- function(option, label) {
  col_name <- paste0("Q8.Option.", option)
  summary <- survey %>%
    filter(!!sym(col_name) == 1) %>%
    select(starts_with("Q29."))
  summary <- enframe(colSums(summary, na.rm = TRUE)) %>%
    rename(options = name, count = value) %>%
    mutate(health_type = label)
  summary$options <- str_replace_all(summary$options, "Q29.Option.1", "Medication")
  summary$options <- str_replace_all(summary$options, "Q29.Option.2", "Mask")
  summary$options <- str_replace_all(summary$options, "Q29.Option.3", "Long Shower")
  summary$options <- str_replace_all(summary$options, "Q29.Option.4", "Doc. - Gen")
  summary$options <- str_replace_all(summary$options, "Q29.Option.5", "Doc. - Lung")
  summary$options <- str_replace_all(summary$options, "Q29.Option.6", "Pers. Air")
  summary$options <- str_replace_all(summary$options, "Q29.Option.7", "Bldg. Air")
  summary$options <- str_replace_all(summary$options, "Q29.Option.8", "Stay Home")
  return(summary)
}

# isolate question 8 option 1 (Excellent)
# group question 29 by options
# summarize question 29 answers
excel_health <- get_health_action(1, "Excellent")

# isolate question 8 option 2 (Good)
# group question 29 by options
# summarize question 29 answers
good_health <- get_health_action(2, "Good")

# isolate question 8 option 3 (Fair)
# group question 29 by options
# summarize question 29 answers
fair_health <- get_health_action(3, "Fair")

# isolate question 8 option 4 (Poor)
# group question 29 by options
# summarize question 29 answers
poor_health <- get_health_action(4, "Poor")

# combine to one dataframe
# the 4 types of health are represented by 'health_level'
total_health <- rbind(excel_health, good_health) %>%
  rbind(fair_health) %>%
  rbind(poor_health)

# Make plot
chart_health_action <- total_health %>%
  ggplot(aes(x = options, y = count, fill = health_type)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(
    title = "Action Depending on Health Level",
    x = "Action",
    y = "Count",
    fill = "Health"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white")) +
  scale_fill_manual(values = c("#ffa600", "#ef5675", "#7a5195", "#003f5c"))

display_chart_1 <- function() {
  chart_health_action
}

# reference; https://r-graph-gallery.com/48-grouped-barplot-with-ggplot2.html

