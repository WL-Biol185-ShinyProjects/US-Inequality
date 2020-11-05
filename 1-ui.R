library(shiny)

fluidPage(
  
  sidebarPanel(
    sliderInput(inputId ="Year",
                label = "Year",
                min = 1900,
                max = 2019,
                animate = animationOptions(interval = 1000, loop = FALSE)
                ),
    
    selectInput(inputId = "Sex",
                label = "Select Sex",
                multiple = TRUE,
                choices = unique(NCHS_._Death_rates_and_life_expectancy_at_birth$Sex),
                selected = "Both Sexes"),
   
     selectInput(inputId = "Race",
                label = "Select Race",
                multiple = TRUE,
                choices = unique(NCHS_._Death_rates_and_life_expectancy_at_birth$Race),
                selected = "All Races")
    
    
  ),
  mainPanel(
    plotOutput("LifeExpectancy",
               click = "LifeExpectancyPlotClick")
  ),
  dataTableOutput("LifeExpectancyInfo")
  
)


