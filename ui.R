
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(DT)

shinyUI(fluidPage(

  # Application title
  titlePanel("Paired Cancer Data Table - SCoNEs"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3(textOutput("widget_title")),
      p(textOutput("description")),
      downloadButton('downloadData', 'Download')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("logratio")
    )
  )
))
