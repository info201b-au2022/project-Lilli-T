# Chart 3
library(tidyverse)
library(dplyr)
library(ggplot2)

#Import data set
raw_data <- read.csv("../data/building_aq_analysis_data.csv")

#Select relevant columns for the third research question
aq <-  raw_data %>% select(bldg, room, location, TOD, period)

#Examine which room is the most occupied during forest fire 
aq <- mutate(aq, place = paste0(bldg,  ', ', room))

occupied_count <- aq %>% group_by(place) %>% filter(period == "Forest fire") %>% filter(TOD == "occupied") %>% count(place)

data <- data.frame(Rooms = occupied_count$place, Occupancy = occupied_count$n)

chart <- ggplot(data, aes(x = "", y = Occupancy, fill = Rooms)) +
  geom_col(color = "black") +
  geom_text(aes(label = occupied_count$n), size = 2,
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y")

display_chart_3 <- function() {
  chart
}
