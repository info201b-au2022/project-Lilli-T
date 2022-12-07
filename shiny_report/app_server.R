# server for app

# load libraries, data set, and functions
library(dplyr)
source("shiny_source/int_chart_1.R")

server <- function(input, output) {
  output$bar_chart <- renderPlotly({return(plot_chart_1(input$health_type))})
}