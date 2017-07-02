---
#Title: "BeerStudy"
#Author: "Nithya Devadoss"
#Date: "July 1, 2017"
#output: /Analysis/Beer.md
#  html_document: /Analysis/Beer.html
#Language Used : R 
    keep_md: yes
---
#Introduction:
### This case study is to analyze everything about Beers and Breweries across United States. We have the sample data collected on Beers and Breweries and is available in the Data directory inside the CaseStudy Repository in github.File count as following:

##Data Dictionary:
###Beers data file has 2410 observations and 7 columns: 

###Beers.csv: 
###1.Name: Name of the beer. 
###2.Beer ID: Unique identiﬁer of the beer
###3.ABV: Alcohol by volume of the beer. 
###4.IBU: International Bitterness Units of the beer. 
###5.Brewery ID: Brewery id associated with the beer. 
###6.Style: Style of the beer. 
###7.Ounces: Ounces of beer.

###Breweries data file has 558 Observations and 4 columns

###Breweries.csv: 
###1.Brew ID: Unique identiﬁer of the brewery. 
###2.Name: Name of the brewery. 
###3.City: City where the brewery is located. 
###4.State: State where the brewery is located.

#File Organization:
###Raw data files and merged data file is available inside the /DataFiles directory 

###1./DataFiles/Beers.csv
###2./DataFiles/Breweries.csv
###3./DataFiles/merge.csv
###DataRead.md will show the markdown file version of the data read step.

# Data Analysis
### Data has been analysed and the analysis script is stored in /Analysis/Beer.md and the corresponding rmd file is /Analysis/Beer.rmd
### The R script can be found inside the same directory /Analysis/BeerAnalysis.R

##Pictorial Results
### All the pictorial results is stored in /Graph directory
### IBU_Vs_ABV , MedABV_Vs_State,MedIBU_Vs_State
