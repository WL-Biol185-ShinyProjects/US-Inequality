geo <- readOGR("counties.json")

healthTable1 <- read_csv("health_ineq_online_table_11.csv")

healthData1 <- left_join(geo@data, healthTable1, by = c("COUNTY" = "county_name"))
geo@data <- healthData1

bins <- c(77, 79, 81, 83, 85, 87, 89, Inf)
pal <- colorBin("YlOrRd", domain = healthTable1, bins = bins)


leaflet(geo) %>%
  setView(-96, 37.8, 4) %>% 
  addPolygons(fillColor = ~pal(health_ineq_online_table_11$le_agg_q4_M), weight = 2, opacity = "white", dashArray = "3", fillOpacity = 0.7) %>% 
  addLegend("bottomright", pal = pal, values = ~bins,
          title = "LE by County",
          labFormat = labelFormat(prefix = "Years: "),
          opacity = 1
)