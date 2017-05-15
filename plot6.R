#14/05/2017 Alexander González
#Peer-graded Assignment: Exploratory Data Analysis. Course Project 2
#output: plot6.png

## Libraries needed: 
library(ggplot2)
library(plyr)

## Set working directory
setwd("~/RWkngdrctry/Project 2 Course 4")

## read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## check the levels for types of vehicles defined
mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
mv.sourcec <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]


## subset our data Baltimore City and the data Los Angeles County and bind the data
emMV.ba <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "24510", ]
emMV.LA <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "06037", ]
emMV.comb <- rbind(emMV.ba, emMV.LA)

## Find the emmissions due to motor vehicles in Baltimore (city) and Los Angeles County
tmveYR.county <- aggregate (Emissions ~ fips * year, data =emMV.comb, FUN = sum ) 
tmveYR.county$county <- ifelse(tmveYR.county$fips == "06037", "Los Angeles", "Baltimore")

##  plotting to png
png("plot6.png")
qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + 
  ggtitle(expression(atop("Motor Vehicle Emission Levels PM2.5  from 1999 to 2008", paste("in Los Angeles County, CA and Baltimore, MD")))) + 
            xlab("Year") + ylab(expression("Levels of PM2.5  Emissions"))
dev.off()

###Plot for markdown
qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + 
  ggtitle(expression(atop("Motor Vehicle Emission Levels PM2.5  from 1999 to 2008", paste("in Los Angeles County, CA and Baltimore, MD")))) + 
  xlab("Year") + ylab(expression("Levels of PM2.5  Emissions"))