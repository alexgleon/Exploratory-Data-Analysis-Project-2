#14/05/2017 Alexander Gonzalez
#Peer-graded Assignment: Exploratory Data Analysis. Course Project 2
#output: plot5.png

## Libraries needed:
library(plyr)
library(ggplot2)

## Set working directory
setwd("~/RWkngdrctry/Project 2 Course 4")

## Step 1: read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset our data  
##check the levels for types of vehicles defined
mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
mv.sourcec <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]

## subset the emissions from motor vehicles from NEI for Baltimore, MD.
emMV.ba <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "24510",]

## find the emissions due to motor vehicles in Baltimore for every year
balmv.pm25yr <- ddply(emMV.ba, .(year), function(x) sum(x$Emissions))
colnames(balmv.pm25yr)[2] <- "Emissions"

## Plot to png
png("plot5.png")
qplot(year, Emissions, data=balmv.pm25yr, geom="line") + 
  ggtitle(expression("Baltimore City  PM2.5 Motor Vehicle Emissions by Year")) + 
  xlab("Year") + ylab(expression("PM2.5 Emissions"))
dev.off()

## Step 5: Plot to markdown
qplot(year, Emissions, data=balmv.pm25yr, geom="line") + 
  ggtitle(expression("Baltimore City  PM2.5 Motor Vehicle Emissions by Year")) + 
  xlab("Year") + ylab(expression("PM2.5 Emissions"))