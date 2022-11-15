# Calculates summary information in report

# Five calculations:
# Mean age of who participated (Q2)
# Maximum age (Q2)
# Minimum age (Q2)
# Percent of people in excellent health who sought information
#     percent of people in poor health who sought information (Q12)
# Overall, what type of message is the most motivating, count (Q20)
# Do people see wildfires as a public health hazard, percent (Q24)

responses <- read.csv("../data/human_response_data.csv")
library(tidyverse)
library(styler)

# returns a data frame
# summarize ages
examine_ages <- function() {
  mean <- round(mean(responses[["Q2.Option.1"]], na.rm = TRUE))
  max <- max(responses[["Q2.Option.1"]], na.rm = TRUE)
  min <- min(responses[["Q2.Option.1"]], na.rm = TRUE)
  summary <- data.frame(stat = c("mean", "max", "min"), value = c(mean, max, min))
  return(summary)
}

# returns a percentage
# seeking info
# isolate excellent health
# of those, what percent sought info
seek_excel <- function () {
  excel_seek <- responses %>%
    filter(Q8.Option.1 == 1)
  seek_temp <- nrow(excel_seek)
  excel_seek <- round(nrow(filter(excel_seek, Q12.Option.1 == 1)) / seek_temp, digits = 3) * 100
  return(excel_seek)
}

# returns a percentage
# isolate poor health
# of those, what percent sought info
seek_poor <- function () {
  poor_seek <- responses %>%
    filter(Q8.Option.4 == 1)
  seek_temp <- nrow(poor_seek)
  poor_seek <- round(nrow(filter(poor_seek, Q12.Option.1 == 1)) / seek_temp, digits = 3) * 100
  return(poor_seek)
}

# type of message
most_motiv <- responses %>%
  select(starts_with("Q20.Option."))
most_motiv <- enframe(colSums(most_motiv, na.rm = TRUE))
colnames(most_motiv) <- c("type", "count")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.1", "text")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.2", "call")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.3", "social media message")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.4", "online message")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.5", "TV message")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.6", "emergency alert")
most_motiv$type <- str_replace_all(most_motiv$type, "Q20.Option.7", "friends or family")

# returns a data frame
popular_type <- function() {
  lg_count <- max(most_motiv$count, na.rm = TRUE)
  lg_type <- filter(most_motiv, count == lg_count)
  lg_type <- pull(lg_type, type)
  return(data.frame(type = c(lg_type), count = c(lg_count)))
}

# returns a percentage
# hazard perception
hzd_perc <- function () {
  perc_temp <- nrow(responses)
  perc_hzd <- round(nrow(filter(responses, Q24.Option.1 == 1)) / perc_temp, digits = 3) * 100
  return(perc_hzd)
}