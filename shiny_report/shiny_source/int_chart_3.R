library(tidyverse)
library(dplyr)
library(plotly)

#Import data set
raw_data <- read.csv("shiny_data/building_aq_analysis_data.csv")

#Data wrangling and plotting
chart_3 <- function(occupancy) {
  aq <-  raw_data %>% select(bldg, room, location, TOD, period)
  
  aq <- mutate(aq, place = paste0(bldg,  ', ', room))
  
  occupied_count <- aq %>% group_by(place) %>% filter(period == "Forest fire") %>% filter(TOD == "occupied") %>% count(place)
  
  data <- data.frame(Rooms = occupied_count$place, Occupancy = occupied_count$n)
  
  if (occupancy == "All rooms") {
    occupancy_rate <- data %>%
      filter(occupied_count$n <= 910) 
  } else if (occupancy == "Often occupied") {
    occupancy_rate <- data %>%
      filter(650 <= occupied_count$n & occupied_count$n < 910) 
  } else if (occupancy == "Less occupied") {
    occupancy_rate <- data %>%
      filter(252 <= occupied_count$n & occupied_count$n < 650) 
  } else if (occupancy == "Least occupied") {
    occupancy_rate <- data %>%
      filter(occupied_count$n <= 252)
  }
  
  chart <- plot_ly(occupancy_rate, labels = ~occupied_count$place, values = ~occupied_count$n, type = 'pie') %>% layout(title = 'Occupancy Rate',
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
  return(chart)
}

