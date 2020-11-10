library(leaflet)
library(tidyverse)
library(ggplot2)


NCHS_._Death_rates_and_life_expectancy_at_birth <- read.csv("~/desktop/dispari-tea2/NCHS_-_Death_rates_and_life_expectancy_at_birth.csv")
Year<- NCHS_._Death_rates_and_life_expectancy_at_birth
function(input, output){


  output$LifeExpectancy<- renderPlot({
      NCHS_Death_rates_and_life_expectancy_at_birth %>%
      filter(Race == input$Race, Sex == input$Sex) %>%
      ggplot(aes(Race, `Average Life Expectancy (Years)`, colour= Sex))+
      geom_bar(stat = "identity") +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
   
})

  
  output$LifeExpectancyInfo <-renderDataTable({
    clickEvent<- input$LifeExpectancyPlotClick
    NCHS_._Death_rates_and_life_expectancy_at_birth %>%
      nearPoints(clickEvent)
  })

  }

