library(shiny)
function(input, output) {
  
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
  RaceLE_NCHSdata <- NCHS_._Death_rates_and_life_expectancy_at_birth
  
  output$downloadData2 <- downloadHandler(
    filename = function() {
      paste("RaceLE_NCHSdata-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(RaceLE_NCHSdata, file)
    }
  )
}