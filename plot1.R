#14/05/2017 Oliver Gonzalez
#Peer-graded Assignment: Exploratory Data Analysis. Course Project 2
#output: plot1.png

## Set working directory
setwd("~/RWkngdrctry/Project 2 Course 4")

##Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data.PM25yr <- tapply(NEI$Emissions, NEI$year, sum)

###Plot to png
png("plot1.png")
plot(names(data.PM25yr), data.PM25yr, type="b", xlab = "Year", 
     ylab = expression("PM2.5 Emissions"),
     main = expression("Total PM2.5 Emissions by Year"), col = "darkgreen", pch = 20)
dev.off()

###Plot for markdown
plot(names(data.PM25yr), data.PM25yr, type="b", xlab = "Year", 
     ylab = expression("PM2.5 Emissions"),
     main = expression("Total PM2.5 Emissions by Year"), col = "darkgreen", pch = 20)