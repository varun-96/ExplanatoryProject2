if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")  
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by.x = "SCC")
  
}

sour <- grepl("Coal", NEISCC$Short.Name, ignore.case = TRUE)
dta <- NEISCC[sour,]

agg_by_year_coal <- aggregate(Emissions ~ year, dta, sum)

g <- ggplot(agg_by_year_coal, aes(factor(year), Emissions))
g + geom_bar(stat = "identity") + xlab("Years") + ylab("Total Emissions")