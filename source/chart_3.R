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
# occupied_count <- mutate(occupied_count, percentage = n / sum(occupied_count$n))

chart <- pie(occupied_count$n, labels = occupied_count$place, main="Pie Chart for room occupancy during forest fire", col=rainbow(25), cex = 0.4)
chart 


#This pie chart is used to answer our third research question regarding which rooms 
#people feel safe to go into during forest fire as air quality decreases. 
#It shows the occupancy rate of each room during forest fires. 
#We noticed that a few rooms have the exact same occupancy rate, it's potentially due to mandatory tasks and responsibilities
#that have to be fulfilled in that space. 
#Viewers can clearly distinguish people's gravitation towards each room in this chart as labels are clear and readible. 