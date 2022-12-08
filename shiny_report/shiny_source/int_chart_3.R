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
  
  occupancy_rate <- data 
  
  if (occupancy == "All rooms") {
    occupancy_rate <- data %>%
      filter(data$Occupancy <= 910) 
  } else if (occupancy == "Often occupied") {
    occupancy_rate <- data %>%
      filter(between(data$Occupancy, 650, 910)) 
  } else if (occupancy == "Less occupied") {
    occupancy_rate <- data %>%
      filter(between(data$Occupancy, 252, 650)) 
  } else if (occupancy == "Least occupied") {
    occupancy_rate <- data %>%
      filter(data$Occupancy <= 252)
  }
  
  chart <- plot_ly(occupancy_rate, labels = ~Rooms, values = ~Occupancy, type = "pie") %>% layout(title = 'Occupancy Rate',
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
  return(chart)
}

chart_3("Often occupied")

