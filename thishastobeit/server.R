library(shiny)
library(shinyWidgets)
function(input, output) {
  
  #code for LE by county data; this will be leaflets and drop down selector
  
  output$LECountyandIncomePercentile<- renderLeaflet({
    
    if (input$CountyChoices == "Q1") {
      # code to make map #1
      geo <- readOGR("counties.json")
      
      healthTable1 <- read_csv("health_ineq_online_table_11.csv")
      
      healthData1 <- left_join(geo@data, healthTable1, by = c("COUNTY" = "county_name"))
      geo@data <- healthData1
      
      bins <- c(77, 79, 81, 83, 85, 87, 89, Inf)
      pal <- colorBin("YlOrRd", domain = healthTable1, bins = bins)
      
      leaflet(geo) %>%
        setView(-96, 37.8, 4) %>% 
        addPolygons(fillColor = ~pal(health_ineq_online_table_11$le_agg_q1_M), weight = 2, opacity = "white", dashArray = "3", fillOpacity = 0.7) %>%
        addLegend("bottomright", pal = pal, values = ~bins,
                  title = "LE by County",
                  labFormat = labelFormat(prefix = "Years: "),
                  opacity = 1
        )

    } else if (input$cloroplethSelector == "Q2") {
      #code to make map 2
      geo <- readOGR("counties.json")
      
      healthTable1 <- read_csv("health_ineq_online_table_11.csv")
      
      healthData1 <- left_join(geo@data, healthTable1, by = c("COUNTY" = "county_name"))
      geo@data <- healthData1
      
      bins <- c(77, 79, 81, 83, 85, 87, 89, Inf)
      pal <- colorBin("YlOrRd", domain = healthTable1, bins = bins)
      
      leaflet(geo) %>%
        setView(-96, 37.8, 4) %>% 
        addPolygons(fillColor = ~pal(health_ineq_online_table_11$le_agg_q2_M), weight = 2, opacity = "white", dashArray = "3", fillOpacity = 0.7) %>%
        addLegend("bottomright", pal = pal, values = ~bins,
                  title = "LE by County",
                  labFormat = labelFormat(prefix = "Years: "),
                  opacity = 1
        )
      
    } else {
      #code to make map 3
      geo <- readOGR("counties.json")
      
      healthTable1 <- read_csv("health_ineq_online_table_11.csv")
      
      healthData1 <- left_join(geo@data, healthTable1, by = c("COUNTY" = "county_name"))
      geo@data <- healthData1
      
      bins <- c(77, 79, 81, 83, 85, 87, 89, Inf)
      pal <- colorBin("YlOrRd", domain = healthTable1, bins = bins)
      
      
      leaflet(geo) %>%
        setView(-96, 37.8, 4) %>% 
        addPolygons(fillColor = ~pal(health_ineq_online_table_11$le_agg_q3_M), weight = 2, opacity = "white", dashArray = "3", fillOpacity = 0.7) %>%
        addLegend("bottomright", pal = pal, values = ~bins,
                  title = "LE by County",
                  labFormat = labelFormat(prefix = "Years: "),
                  opacity = 1
        )
    }
    
  })
  
  
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