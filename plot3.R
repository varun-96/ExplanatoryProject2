library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")  
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

subsetNEI  <- NEI[NEI$fips=="24510", ]
agg_by_year <- aggregate(Emissions ~ year+type, subsetNEI, sum)

g <- ggplot(agg_by_year, aes(year, Emissions, color = type))
g + geom_line() + xlab("Years") + ylab("Total Emissions")