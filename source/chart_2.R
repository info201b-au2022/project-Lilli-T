# Chart 2
library("dplyr")
library("tidyverse")
library("ggplot2")
library("viridis")
library("hrbrthemes")

data <- read.csv("../data/building_aq_analysis_data.csv", stringsAsFactors = FALSE)

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

chart_NV_data <- NV_data %>%
  ggplot(
    mapping = aes(x=datetimePST, y=value, group=room, color=room)
    ) +
    geom_line(size = 0.3) +
    theme_ipsum() +
    scale_x_discrete(labels = 1:29) +
    scale_y_continuous(limits = c(0, 400), breaks = c(0, 100, 200, 300, 400)) +
    labs(
      title = "pm2.5 value in different room in NV November, 2018",
      y = "pm2.5 value",
      x = "date"
    )

chart_MV_data <- MV_data %>%
  ggplot(
    mapping = aes(x=datetimePST, y=value, group=room, color=room)
    ) +
  geom_line(size = 0.3) +
  scale_x_discrete(labels = 3:29) +
  scale_y_continuous(limits = c(0, 400), breaks = c(0, 100, 200, 300, 400)) +
  theme_ipsum() +
  labs(
    title = "pm2.5 value in different room in MV November, 2018",
    y = "pm2.5 value",
    x = "date"
  )

display_chart_2_1 <- function() {
  chart_NV_data
}
display_chart_2_2 <- function() {
  chart_MV_data
}

