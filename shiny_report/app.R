# Load libraries
library(rsconnect)
library(shiny)

# Defines UI and Server
# source("app_ui.R")
# source("app_server.R")
source("app_ui.R")
source("app_server.R") 

# Run app
shinyApp(ui = ui, server = server)