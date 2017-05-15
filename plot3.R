#14/05/2017 Alexander Gonzalez
#Peer-graded Assignment: Exploratory Data Analysis. Course Project 2
#output: plot3.png

## Libraries needed:
library(ggplot2)
library(plyr)

## Set working directory
setwd("~/RWkngdrctry/Project 2 Course 4")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Obtain the subsets to plot
baltimore <- subset (NEI, fips == "24510")
typePM25.year <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

## Rename the col: Emissions
colnames(typePM25.year)[3] <- "Emissions"

## Plot to png
png("plot3.png") 
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") +
     ggtitle("Baltimore City PM2.5 Emmission by source type and year") + xlab("Year") +
     ylab("PM2.5 Emissions")
dev.off()

###Plot for markdown
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") +
ggtitle("Baltimore City PM2.5 Emmission by source type and year") + xlab("Year") +
ylab("PM2.5 Emissions")
