# Merging DataSets 
## Author : Nithya Devadoss

merge_df<-merge(Breweries,Beers,by.x = "Brew_ID" , by.y = "Brewery_id")
## Number of observations after data merging
#### str function displays the class of the variable and the total number of observations
str(merge_df)
## **************
## First 6 records
## **************
#### head function displays the first 6 observations by default
head(merge_df)
## *************
## Last 6 records
## *************
#### tail function displays the last 6 observations by default
tail(merge_df)