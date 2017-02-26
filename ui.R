#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that fits a model on loaded data set
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The World's Phones"),
  
  # Sidebar with a list box of regions in the world 
  sidebarLayout(
    sidebarPanel(
        selectInput("phoneregion",label = "Select Region:",
            choices = colnames(WorldPhones)),
        hr(),
        h5("Select region to view growth of number of phones in the world between 1951 to 1961. The best fit model for this period will be calculated.")
    ),
    
    # Show a plot of no. of phones for the selected region vs. time and fit a best fit curve
    mainPanel(
        plotOutput("phoneplot")
    )
  )
))
