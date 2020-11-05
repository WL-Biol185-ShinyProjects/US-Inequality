library(tidyverse)
library(leaflet)
library(ggplot2)
library(readxl)
blackonlyincome <- read_excel("blackonlyincome.xlsx")
whiteonlyincome <- read_excel("whiteonlyincome.xlsx")


shinyServer(function(input, output) {
  
  output$incomeplot <- renderPlot({
    combined_income%>%
      filter(Year==input$Year)%>%
      ggplot(aes(Race, `Mean Income 2019`, fill = Race)) +  geom_bar(stat = "identity")
  
   
    })
  
  output$blackincome <- renderPlot({
    blackonlyincome%>%
      ggplot(aes(Year, `Mean Income 2019`)) +
      geom_point()
  })
  
  output$whiteincome <- renderPlot({
    whiteonlyincome %>%
      ggplot(aes(Year, `Mean Income 2019`)) +
      geom_point()
  })
  
  
  
}
)

