# server for app

# load libraries, data set, and functions
library(dplyr)
source("shiny_source/int_chart_1.R")
source("shiny_source/int_chart_2.R")
source("shiny_source/int_chart_3.R")

server <- function(input, output) {
  output$bar_chart <- renderPlotly({return(plot_chart_1(input$health_type))})
  output$line_graph1 <- renderPlotly({display_chart_MV(input$input_room1)})
  output$line_graph2 <- renderPlotly({display_chart_NV(input$input_room2)})
  output$pie_chart <- renderPlotly({return(chart_3(input$occupancy))})
}

