#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Load libraries
suppressMessages(library(datasets))
suppressMessages(library(ggplot2))
suppressMessages(library(reshape2))

phoneplot <- function (region)
{
    # Make a narrow data set
    WP <- melt(WorldPhones)
    colnames(WP) <- c("Year","Region","Phones")
    
    # Select only rows for selected region
    WP <- WP[which(WP$Region == region),]
    
    # Plot no. of phones vs. time for selected region and fit a smooth "loess" curve
    p <- ggplot(WP,aes(x=Year,y=Phones)) +
        labs(x="Year",y="Number of Phones (in thousands)") + 
        geom_point(size=4) +
        geom_smooth()
    
    return(p)
}

library(shiny)

# Define server logic
shinyServer(function(input, output) {
    output$phoneplot <- renderPlot({phoneplot(input$phoneregion)})
})
