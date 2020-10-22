

library(shiny)
library(shinyWidgets)

# Define UI ----
ui <- fluidPage(
  
setBackgroundColor (
    color = c("#F8F8FF", "#CFEEFA"),
    gradient = "linear",
    direction = "bottom"
  ),
  
  
  titlePanel("Income & Health Inequality in America"),
  sidebarLayout(
    sidebarPanel(
      h2("Quick Acknowledgment"),
      p("We would like to thank Dr. Gregg Whitworth for his support in the development of this website as well
        as Dr. Jonathan Eastwood for his advice on the outline of this project."),
      br()
    ),
    mainPanel(
      h1("The Why Behind the Project"),
      p("The year 2020 has certaintly not been an easy one for the United States overall.", 
        ("It has also shown many issues that as a nation we have tried to sweep under the rug,"), 
        "such as income disparity and health outcomes of certain communities."),
      br(),
      p("For these reasons we decided to look at income disparity between whites and blacks over time in the U.S.
        as well as life expectancy in U.S. counties as of 2017. If this topic interests you, further reasearch can be done here.",
        a("Pew Research Center.", 
          href = "https://www.pewsocialtrends.org/2016/06/27/1-demographic-trends-and-economic-well-being/")),
      br(),
      h2("Few of the Things to be Shown"),
      p("- Life Expectancy between whites and blacks in the United States over time."),
      p("- Economic disparity over time between whites and blacks in the United States." 
        ),
      p("- Life Expectancy by counties in the United States."),
      p("- Data clean up for future researchers to be able to use readily.")
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)

