geo <- readOGR("counties.json")
leaflet(geo) %>%
  setView(-96, 37.8, 4) %>% 
  addPolygons(fillColor = ~pal(health_ineq_online_table_11$le_agg_q2_F), weight = 2, opacity = "white", dashArray = "3", fillOpacity = 0.7)