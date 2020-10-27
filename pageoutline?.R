
library(markdown)
library(shiny)
library(shinyWidgets)

# Define UI ----
ui <- fluidPage(
  
  
setBackgroundColor (
    color = c("#F8F8FF", "#CFEEFA"),
    gradient = "linear",
    direction = "bottom"
  ),
  

ui <- navbarPage("Inequality Navigation Bar",
                 tabPanel("Home", 
                          titlePanel("Income & Health Inequality in America"),
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
                            h1("Few of the Things to be Shown"),
                            p("- Life Expectancy between whites and blacks in the United States over time."),
                            p("- Economic disparity over time between whites and blacks in the United States." 
                            ),
                            p("- Life Expectancy by counties in the United States."),
                            p("- Data clean up for future researchers to be able to use readily."),
                              img(src = "ineqpic.png", height = 480, width = 720, align = "center")
                          )
    ),
    tabPanel("Life Expectancy Disparity by Race"),
    tabPanel("Life Expectancy by Counties"),
    tabPanel("Income Disparity by Race"),
    tabPanel("Data & Acknowlegments",
             h2("Acknowledgments"),
             p("We would first like to thank Dr. Gregg Whitworth for assisting us with this project. He helped
               with everything from the brainstorming process to helping us create the code for visualizing the data we found.
               We would also like to thank Dr. Jonathan Eastwood as he provided advice on the brainstorming and execution aspects of this
               project which were helpful considering this topic is his speciality."),
             br(),
             p("We hope that these results find their way to people who can continue carrying out the analysis that we started
               as a class project. Future projects could show the inequality between whites and other races/ethnicities in America,
               such as Hispanics and Asians,  or compare other areas of inequality."),
             br(),
             p("The data for this project was not as easy to collect as we originally thought. The data was also not as clean
               as it could have been, expecially datasets from the CDC. As a result, we decided to clean the data as best as possible
               and post it here so that future studies may be able to have the data readily available."),
             h4("Download County-level Life Expectancy Data"),
             downloadBttn(
               outputId = "downloadData1",
               style = "pill",
               color = "primary",
               size = "sm"
             ),
             h4("Download Life Expectancy by Race Data"),
             downloadBttn(
               outputId = "downloadData2",
               style = "pill",
               color = "primary",
               size = "sm"
             ),
             h4("Download Income Inequality by Race Data"),
             downloadBttn(
               outputId = "downloadData3",
               style = "pill",
               color = "primary",
               size = "sm"
             )
    )
  )
)
  



# Define server logic ----
server <- function(input, output) {
  # County Life Expectancy Data
  CountyLevelLE <- health_ineq_online_table_11
  
  output$downloadData1 <- downloadHandler(
    filename = function() {
      paste("CountyLevelLE-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(CountyLevelLE, file)
    }
  )
  # Life Expectancy by Race Data
  # Income Disparity by Race Data
    }

# Run the app ----
shinyApp(ui = ui, server = server)

