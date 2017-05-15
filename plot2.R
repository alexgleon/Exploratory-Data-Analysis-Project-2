#14/05/2017 Oliver Gonzalez
#Peer-graded Assignment: Exploratory Data Analysis. Course Project 2
#output: plot2.png

## Set working directory
setwd("~/RWkngdrctry/Project 2 Course 4")

## Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Obtain the subsets to plot
baltimore <- subset (NEI, fips == "24510")
data.PM25yr <- tapply(baltimore$Emissions, baltimore$year, sum)

## Plot to png
png("plot2.png")
plot(names(data.PM25yr), data.PM25yr, type = "b", xlab="Year", 
     ylab= expression("PM2.5 Emissions"), 
     main=expression("Total for Baltimore City PM2.5 Emissions by Year"), 
     col = "darkblue", pch = 20)
dev.off()  

###Plot for markdown
plot(names(data.PM25yr), data.PM25yr, type = "b", xlab="Year", 
     ylab= expression("PM2.5 Emissions"), 
     main=expression("Total for Baltimore City PM2.5 Emissions by Year"), 
     col = "darkblue", pch = 20)
