library(leaflet)
library(tidyverse)
library(ggplot2)


NCHS_._Death_rates_and_life_expectancy_at_birth <- read.csv("~/desktop/dispari-tea2/NCHS_-_Death_rates_and_life_expectancy_at_birth.csv")
Year<- NCHS_._Death_rates_and_life_expectancy_at_birth
function(input, output){


  output$LifeExpectancy<- renderPlot({
      NCHS_._Death_rates_and_life_expectancy_at_birth %>%
      filter(Race == input$Race, Sex == input$Sex) %>%
      ggplot(aes(Race, Average.Life.Expectancy..Years., shape= Race, colour= Sex))+
      geom_point()
   
})

  
  output$LifeExpectancyInfo <-renderDataTable({
    clickEvent<- input$LifeExpectancyPlotClick
    NCHS_._Death_rates_and_life_expectancy_at_birth %>%
      nearPoints(clickEvent)
  })

  }

