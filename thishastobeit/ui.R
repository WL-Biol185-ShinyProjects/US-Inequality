library(shiny)
<<<<<<< HEAD
library(shinyWidgets)
=======
library(tidyverse)
<<<<<<< HEAD
library(ggplot2)
>>>>>>> 12fa97bc04b535aa705c804e574423205e8032b2
=======
library(shinyWidgets)
>>>>>>> a2aa7facec4b902ce951f7f1103f4333b89804fa
fluidPage(
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
                              p("- Data clean up for future researchers to be able to use readily.")
                            )
                   ),
                   tabPanel("Life Expectancy Disparity by Race"),
<<<<<<< HEAD
                   tabPanel("Life Expectancy by Counties",
                            leafletOutput("LECountyandIncomePercentile"),
                            selectInput("CountyChoices", "Select County Dataset", choices = c("Q1", "Q2", "Q3"))
                            ),
=======
                            titlePanel("Life Expectancy dispparities between White and Black Americans"),
                   sidebarPanel(
                     sliderInput(inputId ="Year",
                                 label = "Year",
                                 min = 1900,
                                 max = 2019,
                                 value = 1950,
                                 animate = animationOptions(interval = 1000, loop = FALSE)
                     ),
                     
                     selectInput(inputId = "Sex",
                                 label = "Select Sex",
                                 multiple = TRUE,
                                 choices = unique(NCHS_Death_rates_and_life_expectancy_at_birth$Sex),
                                 selected = "Both Sexes"),
                     
                     selectInput(inputId = "Race",
                                 label = "Select Race",
                                 multiple = TRUE,
                                 choices = unique(NCHS_Death_rates_and_life_expectancy_at_birth$Race),
                                 selected = "All Races")
                     
                     
                   ),
                   mainPanel(
                     plotOutput("LifeExpectancy",
                                click = "LifeExpectancyPlotClick")
                   ),
                   dataTableOutput("LifeExpectancyInfo"),
                   
                   
                   tabPanel("Life Expectancy by Counties"),
                   
                   
>>>>>>> 12fa97bc04b535aa705c804e574423205e8032b2
                   tabPanel("Income Disparity by Race"),
                   
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
                     ),
                   
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
               as it could have been, expecially datasets from the Census. As a result, we decided to clean the data as best as possible
               and post it here so that future studies may be able to have the data readily available. These datasets will become available "),
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
                            h4("Download Income Inequality by Race Data - White"),
                            downloadBttn(
                              outputId = "downloadData3",
                              style = "pill",
                              color = "primary",
                              size = "sm"
                            ),
                            h4("Download Income Inequality by Race Data - Black"),
                            downloadBttn(
                              outputId = "downloadData4",
                              style = "pill",
                              color = "primary",
                              size = "sm"
                            ) 
                   )
  )
)
)