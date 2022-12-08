library("dplyr")
library("tidyverse")
library("ggplot2")
library("viridis")
library("hrbrthemes")

data <- read.csv("shiny_data/building_aq_analysis_data.csv", stringsAsFactors = FALSE)

NV_data <- data %>%
  select(bldg, room, location, datetimePST, measurement, value) %>%
  filter(bldg == "Wurster (NV)") %>%
  filter((measurement == "corrected_pm2.5") | (measurement == "pm2.5")) %>%
  filter(str_detect(datetimePST, "00:00:00")) %>%
  filter(datetimePST <= "2018-11-30" & datetimePST >= "2018-11-01")

NV_data <- lapply(NV_data, gsub, pattern = "00:00:00", replacement = "", fixed = TRUE) 
NV_data <- lapply(NV_data, gsub, pattern = "2018-", replacement = "", fixed = TRUE) 
NV_data <- data.frame(c(NV_data))
NV_data$value = as.numeric(as.character(NV_data$value))
NV_data <- na.omit(NV_data)

MV_data <- data %>%
  select(bldg, room, location, datetimePST, measurement, value) %>%
  filter(bldg == "4th St (MV)") %>%
  filter((measurement == "corrected_pm2.5") | (measurement == "pm2.5")) %>%
  filter(str_detect(datetimePST, "00:00:00")) %>%
  filter(datetimePST <= "2018-11-30" & datetimePST >= "2018-11-01") %>%
  filter(room != "inside")

MV_data <- lapply(MV_data, gsub, pattern = "00:00:00", replacement = "", fixed = TRUE) 
MV_data <- lapply(MV_data, gsub, pattern = "2018-", replacement = "", fixed = TRUE) 
MV_data <- data.frame(c(MV_data))
MV_data$value = as.numeric(as.character(MV_data$value))

NV_final_data <- function(input_room) {
  NV_data <- NV_data %>%
    filter(room == input_room) %>%
    filter(measurement == "pm2.5") %>%
    select(room, datetimePST, value)
  NV_data
}
MV_final_data <- function(input_room) {
  MV_data <- MV_data %>%
    filter(room == input_room) %>%
    filter(measurement == "pm2.5") %>%
    select(room, datetimePST, value)
  MV_data
}
display_chart_MV <- function(input_room) {
  MV_data <- MV_data %>%
    filter(room == input_room | room == "outside") %>%
    filter(measurement == "pm2.5") %>%
    select(room, datetimePST, value)
  p <- MV_data %>%
    plot_ly(x = ~datetimePST,
            y = ~value,
            color = ~room,
            type = "scatter",
            mode = "lines") %>%
    layout(
      title = paste0("pm2.5 value in ", input_room, " v.s. outside(MV) in November, 2018")
      
    )
  return(p)
}
display_chart_NV <- function(input_room) {
  NV_data <- NV_data %>%
    filter(room == input_room | room == "outside") %>%
    filter(measurement == "pm2.5") %>%
    select(room, datetimePST, value)
  p <- NV_data %>%
    plot_ly(x = ~datetimePST,
            y = ~value,
            color = ~room,
            type = "scatter",
            mode = "lines") %>%
    layout(
      title = paste0("pm2.5 value in ", input_room, " v.s. outside(NV) in November, 2018")
      
    )
  return(p)
}
display_chart_NV("C373c")


