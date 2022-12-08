# ui for app

# load libraries and data set
library(shiny)
library(plotly)
library(ggplot2)
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

list_room1 <- function() {
  room_type <- c("corridor1", "corridor2", "cubicle3", "cubiclecorner",
                 "cubiclehotdesk", "emptyfloor", "floor2mid", "floor2wall",
                 "hotdesk1", "hotdesk2", "Moffice", "pantry", "Poffice")
  list_room <- as.list(setNames(room_type, room_type))
  return(list_room)
}

list_room2 <- function() {
  room_type <- c("C373c", "w232", "w250a", "w348", "w353", "w373a", "w373c",
                 "w390a", "w390d")
  list_room <- as.list(setNames(room_type, room_type))
  return(list_room)
}

user_room1 <- selectInput(
  inputId = "input_room1",
  label = "Room Selection (MV)",
  choices = list_room1(),
  selected = "corridor1"
)

user_room2 <- selectInput(
  inputId = "input_room2",
  label = "Room Selection (NV)",
  choices = list_room2(),
  selected = "C373c"
) 

findings_two_panel <- tabPanel(
  "Rooms Resistance",
  titlePanel("Reaction of Different types of rooms"),
  sidebarLayout(
    sidebarPanel(
      user_room1,
      user_room2
    ),
    mainPanel(
      plotlyOutput("line_graph1"),
      p(),
      plotlyOutput("line_graph2"),
      p("This data collects the value of pm2.5 measured inside and outside of 
        each of the specific building, distributed in two areas, in November,
         2018. The graph is important because it reveals which room types can 
        insulate more particle during an increase of wildfire smoke. In NV, the 
        values inside w373a and w390a show greatest gap between themselves and 
        outside whereas w250a shows smallest gap, which is less resistant than 
        others. In MV, the pantry shows less resistant while cubicle and hotdesk 
        are most resistant.")
    )
  )
)

findings_three_panel <- tabPanel(
  "Three"
)

# beginning of content for part three - summary takeaways
summary_panel <- tabPanel(
  "Summary",
  p("The first takeaway would be the majority people in the greater Boise area
    ranked themselves as in good health or excellent health, most of them prefer
    staying at home to protect themselves. Among those who ranked themselves as
    poor and fair health, they choose to take medications and prefered moving to
    a building with an air filter, which is also a popular reaction made by those
    who are in good or excellent health."),
  p(),
  p("Secondly, we can learn from the bar chart that people who ranked themselves
    have either fair or poor health condition prefer visiting doctors and taking
    medications; in contrast, people who ranked themselves as excellent or good
    health would rather self-protecting, such as staying at home. We can
    conclude that participants with lower general health are more conscious of
    the negative health effects of wildfires as others."),
  p(),
  p("While comparing the actual particle concentration in each room type with the
    distribution of rooms people feel the safest to go into as air quality
    decreases, we realize that a large percentage of people do not choose rooms
    with relatively low levels of pm2.5, which may be a bias in people's
    perception. Specifically, the room w250a have the best measured air quality
    but it is the only one of the second most rooms people find safest.")
  
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