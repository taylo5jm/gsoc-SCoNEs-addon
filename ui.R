# ui.R
# Justin Taylor
# 3/5/2016
library(shiny)
library(DT)

shinyUI(fluidPage(

  # Application title
  titlePanel("Paired Cancer Data Table - SCoNEs"),

  # Data description and download button
  sidebarLayout(
    sidebarPanel(
      h3(textOutput("widget_title")),
      p(textOutput("description")),
      downloadButton('downloadData', 'Download')
    ),
    
    # table of log ratios
    mainPanel(
      dataTableOutput("logratio")
    )
  )
))
