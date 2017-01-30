if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")  
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

subsetNEI  <- NEI[NEI$fips=="24510", ]
agg_by_year <- aggregate(Emissions ~ year, subsetNEI, sum)

barplot(height = agg_by_year$Emissions, xlab = "years", ylab = "Total Emissions")
