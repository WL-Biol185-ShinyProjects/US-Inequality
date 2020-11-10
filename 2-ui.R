library(shiny)


fluidPage(
  
  sidebarPanel(
    sliderInput(inputId ="Year" ,
                label = "Year" ,
                min = 1980 ,
                max = 2019,
                value = 1980,
                animate = animationOptions(interval = 1000, loop = FALSE)),
  
  
  mainPanel(
    plotOutput("incomeplot"),
    plotOutput("blackincome"),
    plotOutput("whiteincome")
  )
  )
  ) 

