source("downloadarchive.R")

## Load the data

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

aggdata <- aggregate(Emissions~year,data = NEI,FUN = sum)

## Create BarPlot and Export as PNG file

png(filename = "plot1.png",width = 480, height = 480,units = "px")

barplot(
    (aggdata$Emissions)/10^6,
    names.arg = aggdata$year,
    col = "pink",
    xlab = "Year",
    ylab = "PM2.5 Emissions (10^6 Tons)",
    main = "PM2.5 Emissions for all US Sources (Total)"
)

dev.off()
