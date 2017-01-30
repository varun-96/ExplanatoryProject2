if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")  
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

agg_by_year <- aggregate(Emissions ~ year, NEI, sum)

barplot(height = agg_by_year$Emissions, xlab = "years", ylab = "Total Emissions")
