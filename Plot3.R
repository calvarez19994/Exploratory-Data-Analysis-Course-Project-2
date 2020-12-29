source("downloadarchive.R")

## Load the Libraries
library(ggplot2)

## Load the data

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Subset NEI data by Baltimore
baltimoreNEI <- NEI[fips=="24510",]

png("Plot3.png")

ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source"))

dev.off()