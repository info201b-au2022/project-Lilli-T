# ui for app

# load libraries and data set
library(shiny)
library(plotly)
source("shiny_source/report_text.R")

# beginning of content for part one - introduction
intro_panel <- tabPanel(
  "Introduction"
)

# beginning of content for part two - three interactive pages

# make list for drop down menu
list_health <- function() {
  health_type <- c("Excellent", "Good", "Fair", "Poor")
  list_regions <- as.list(setNames(health_type, health_type))
  return(list_regions)
}

# panel for chart options
# widget of drop down to choose country
bar_sidebar_content <- sidebarPanel(
  selectInput("health_type",
              label = "Health Type",
              choices = list_health()
  )
)

# panel for displaying chart
bar_main_content <- mainPanel(
  plotlyOutput("bar_chart"),
  p("This data comes from a survey in which participants ranked their own 
    general health, then answered questions regarding their attitudes towards 
    wildfires. This chart is important because it reveals how the general 
    population in the greater Boise area react to protect themselves about 
    wildfire smoke. The majority of respondents ranked themselves as either in 
    good health or excellent health. This chart demonstrates that staying 
    at home was the most common course of action for those in excellent and good 
    health. However, those in poor and fair health reported that taking 
    medications was the most common action. Additionally, those in good health’s 
    third most popular action was to use a personal air filter. Moving to a 
    building with an air filter was the third, and fifth choice for those in 
    fair and good health, respectively.")
)

bar_panel <- tabPanel(
  "Action Responses",
  titlePanel("Popular Courses of Action"),
  sidebarLayout(
    bar_sidebar_content,
    bar_main_content
  )
)

findings_two_panel <- tabPanel(
  "Two"
)

findings_three_panel <- tabPanel(
  "Three"
)

# beginning of content for part three - summary takeaways
summary_panel <- tabPanel(
  "Summary"
)

# beginning of content for part four - report page
report_panel <- tabPanel(
  "Report",
  titlePanel("Report"),
  markdown(genenerate_report())
)

ui <- navbarPage("Human Response to Wildfires",
                 intro_panel,
                 bar_panel,
                 findings_two_panel,
                 findings_three_panel,
                 summary_panel,
                 report_panel)