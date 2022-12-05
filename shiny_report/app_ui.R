# ui for app

# load libraries and data set
library("shiny")
library("plotly")

# beginning of content for part one - introduction
intro_panel <- tabPanel(
  "Introduction"
)

# beginning of content for part two - three interactive pages
findings_one_panel <- tabPanel(
  "One"
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
  "Report"
)

ui <- navbarPage("Human Response to Wildfires",
                 intro_panel,
                 findings_one_panel,
                 findings_two_panel,
                 findings_three_panel,
                 summary_panel,
                 report_panel)