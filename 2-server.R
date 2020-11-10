library(tidyverse)
library(leaflet)
library(ggplot2)
library(readxl)
blackonlyincome <- read_excel("blackonlyincome.xlsx")
whiteonlyincome <- read_excel("whiteonlyincome.xlsx")
combined_income <- read_excel("combined income.xlsx")


shinyServer(function(input, output) {
  
  output$incomeplot <- renderPlot({
    combined_income%>%
      filter(Year==input$Year)%>%
      ggplot(aes(Race, `Mean Income 2019`, fill = Race)) + 
      geom_bar(stat = "identity") +
      ggtitle("Income Inequality  Over Time") +
      xlab("Race") + ylab("Average Yearly Income") +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
  
   
    })
  
  output$blackincome <- renderPlot({
    blackonlyincome%>%
      ggplot(aes(Year, `Mean Income 2019`)) +
      geom_point() +
      ggtitle("Black Income") +
      xlab("Year") + ylab("Income") +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
  })
  
  output$whiteincome <- renderPlot({
    whiteonlyincome %>%
      ggplot(aes(Year, `Mean Income 2019`)) +
      geom_point() +
      ggtitle("White Income") +
      xlab("Year") + ylab("Income") +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
  })
  

}
)

