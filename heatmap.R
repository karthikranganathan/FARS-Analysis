
pa$State.District <- as.character(people$State)
pa$ST_CASE = as.numeric(pa$ST_CASE)

pa <- merge.data.frame(accident,people,by = "ST_CASE")
pa <- merge.data.frame(pa,VEH_15,by = "ST_CASE")

accident$LATITUDE <-accident$LATITUDE-0.1

for (i in 1:nrow(pa)) {
  
  latlon = geocode(pa[i,1])
  
  accident$LONGITUD[i] = as.numeric(latlon[1])
  
  accident$LATITUDE[i] = as.numeric(latlon[2])
  
}

mv_num_collisions = data.frame(accident$ST_CASE, accident$LONGITUD, accident$LATITUDE)

colnames(mv_num_collisions) = c('collisions','lon','lat')

mv_num_collisions$collisions <- "1"
usa_center = as.numeric(geocode("United States"))
USAMap = ggmap(get_googlemap(center=usa_center, scale=2, zoom=4), extent="normal")

#US MAp
USAMap +
geom_point(aes(x=lon, y=lat), data=mv_num_collisions, col="blue", alpha=0.05)  +
  coord_fixed(xlim=c(-124, -68),ylim=c(23, 49), ratio=1.4)
#Florida
USAMap +
  geom_point(aes(x=lon, y=lat), data=mv_num_collisions, col="blue", alpha=0.03)  +
  coord_fixed(xlim=c(-76, -85),ylim=c(22, 29), ratio=1.4)

#California

USAMap +
  geom_point(aes(x=lon, y=lat), data=mv_num_collisions, col="blue", alpha=0.03)  +
  coord_fixed(xlim=c(-125, -110),ylim=c(29, 40), ratio=1.4)

#Texas
USAMap +
  geom_point(aes(x=lon, y=lat), data=mv_num_collisions, col="blue", alpha=0.03)  +
  coord_fixed(xlim=c(-109, -90),ylim=c(23, 34), ratio=1.4)


