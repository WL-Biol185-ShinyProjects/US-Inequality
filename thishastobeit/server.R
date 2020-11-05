library(shiny)
function(input, output) {
  
  #code for timelapse of income inequality among blacks and whites
  
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
  
  # Life Expectancy at Birth by Race Data; NCHS
  RaceLE_NCHSdata <- NCHS_Death_rates_and_life_expectancy_at_birth
  
  output$downloadData2 <- downloadHandler(
    filename = function() {
      paste("RaceLE_NCHSdata-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(RaceLE_NCHSdata, file)
    }
  )
  
  # Income inequality by Race Data - White; Census
  
  whiteonlyCensusIncomedata <- whiteonlyincome
  
  output$downloadData3 <- downloadHandler(
    filename = function() {
      paste("whiteOnlyCensusIncomedata-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(whiteonlyCensusIncomedata, file)
    }
  )
  
  # Income inequality by Race Data - Black; Census
  
  blackonlyCensusIncomedata <- blackonlyincome2
  
  output$downloadData4 <- downloadHandler(
    filename = function() {
      paste("blackOnlyCensusIncomedata-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(blackonlyCensusIncomedata, file)
    }
  )
  
}