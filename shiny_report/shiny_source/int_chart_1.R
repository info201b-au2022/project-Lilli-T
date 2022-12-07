# Interactive chart 1 for shiny application
# bar chart
survey <- read.csv("shiny_data/human_response_data.csv")
library(tidyverse)
library(plotly)
library(styler)

# Returns data frame to be plotted
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
  tot_respses_this_health <- sum(summary$count, na.rm = TRUE)
  summary <- summary %>%
    mutate(percent_tot_votes = (count / tot_respses_this_health) * 100)
  return(summary)
}

# make plot
plot_chart_1 <- function(health_type) {
  # isolate corresponding responses
  # group question 29 by options
  # summarize question 29 answers
  if (health_type == "Excellent") {
    this_health <- get_health_action(1, "Excellent")
    color <- "#00A8B5"
  } else if (health_type == "Good") {
    this_health <- get_health_action(2, "Good")
    color <- "#774898"
  } else if (health_type == "Fair") {
    this_health <- get_health_action(3, "Fair")
    color <- "#DE4383"
  } else if (health_type == "Poor") {
    this_health <- get_health_action(4, "Poor")
    color <- "#F3AE4B"
  } else {
    return("Error: health_type not found")
  }

  chart_health_action <- this_health %>%
    plot_ly(x = this_health$options,
            y = this_health$count,
            type = "bar",
            marker = list(color = color),
            hovertemplate = paste0(round(this_health$percent_tot_votes, digits = 1), "%",
                                   "<br>", this_health$count, " votes<br>",
                                   "<extra></extra>")
    ) %>%
    layout(
      title = list(text = "Action Depending on Health Level",
                   font = list(size = 14)),
      yaxis = list(title = "Count"),
      xaxis = list(title = "Action")
    )
  return(chart_health_action)
}