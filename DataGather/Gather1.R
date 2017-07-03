## In order to perform the study we will do the following steps which will also answer the questions :
### Load the required libraries to perform the study.We will need readr for file reading 
### and ggplot2 for br plot and scatter plot


library(readr)



## Reading Files 
#### read.csv will read the csv file , header is set to true and all blanks will be read as NA
#### This will help for easy data cleanup

Breweries <- read.csv("C:/Nithya/MSDS/Term1/6306_Doing_DS/Week7/CaseStudy/Download/Breweries.csv",header=T,na.strings="")
str(Breweries)
colSums(is.na(Breweries))
## Breweries data file has 558 Observations and 4 columns