if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")  
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by.x = "SCC")
  
}

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type == "ON-ROAD",]

agg_by_year_vehicle <- aggregate(Emissions ~ year, subsetNEI, sum)

g <- ggplot(agg_by_year_vehicle, aes(factor(year), Emissions))
g + geom_bar(stat = "identity") + xlab("Years") + ylab("Total Emissions")



