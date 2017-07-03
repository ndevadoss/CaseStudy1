# MakeFile
### Author : Nithya Devadoss


## Set working directory
setwd("C:\Users\NithyaDoss\Documents\Git\CaseStudy1\DataFiles")

## Gather and cleanup data files 
source('DataGather/Gather1.R')
source('DataGather/Gather2.R')

## Merge cleaned dataframes
source('DataMerge/DataMerge.R')

## Run Analysis
source('Analysis/BeerAnalysis.R')
