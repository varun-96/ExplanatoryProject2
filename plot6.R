if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")  
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by.x = "SCC")
  
}

subsetNEI_baltandLA <- NEI[(NEI$fips=="24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD",]
agg_by_year_both <- aggregate(Emissions ~ year + fips, subsetNEI_baltandLA, sum)

agg_by_year_both$fips[agg_by_year_both$fips == "24510"] = "Baltimore"
agg_by_year_both$fips[agg_by_year_both$fips == "06037"] = "Los Angeles"

g <- ggplot(agg_by_year_both, aes(factor(year), Emissions))
g <- g + facet_grid(.~fips)
g + geom_bar(stat = "identity") + xlab("Years") + ylab("Total Emissions")