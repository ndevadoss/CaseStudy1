## In order to perform the study we will do the following steps which will also answer the questions :
### Load the required libraries to perform the study.We will need readr for file reading 
### and ggplot2 for br plot and scatter plot

library(readr)
library(ggplot2)


## Reading Files 
#### read.csv will read the csv file , header is set to true and all blanks will be read as NA
#### This will help for easy data cleanup

Beers <- read.csv("C:/Nithya/MSDS/Term1/6306_Doing_DS/Week7/CaseStudy/Download/Beers.csv",header=T,na.strings="")
Breweries <- read.csv("C:/Nithya/MSDS/Term1/6306_Doing_DS/Week7/CaseStudy/Download/Breweries.csv",header=T,na.strings="")
#### str function will display the field names and their datatype. It also displays the number of observations and the class of the variable

str(Beers)
str(Breweries)

## Beers data file has 2410 observations and 7 columns
## Breweries data file has 558 Observations and 4 columns

## Answers to the 7 Questions 

# 1. Count the number of breweries by state
#### Base package has aggregate function which can be used to count the rows based on a group by variable
#### group by here is on state and we will get the count of brew id . this can be any other variable in the dataframe
aggregate(cbind(count = Breweries$Brew_ID) ~ Breweries$State, 
          data = Breweries, 
          FUN = function(x){NROW(x)})


### There are 47 breweries in CO , followed by CA with 39 Breweries
### On the contrary , there is only one Brewery in DC,ND,SD,WV


# 2. Merging Beers and Breweries data
#### merge function is used to merge 2 dataframes Beer and Breweries with a joining column which is brewid. 
#### Since the common column name is different in both dataframes we can use by.x and by.y argument to define the joining column name
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


### After merging we have 2410 obs. of  10 variables. This dataset is available in Data Directory along with the sample data. Filename : merge.csv
write.csv(merge_df, file = "C:/Nithya/MSDS/Term1/6306_Doing_DS/Week7/CaseStudy/Download/merge.csv", row.names = TRUE)
#### write function exports the dataframe to a file format and to the location specified
# 3. Reporting # of NA's
#### is.na function is used to find the observations which is NA which is the result of merge or the blanks which were converted to NA when we read the file
#### colsums will get the total count of the observations if is.na returns true
colSums(is.na(merge_df))

### Based on the result ,we have 62 NA in the column ABV , 1005 NA in the column IBU and 5 NA in the column Style. 

# 4.Median alcohol content for each state
#### aggregate function is used to get the median value of ABV group by state.na.rm is set to TRUE to remove the NA observations and then get the median value
ABV_ST<-aggregate(merge_df$ABV ~ merge_df$State, data = merge_df, median,na.rm=TRUE)
#### Setting the column names of the derived dataframe to a meaningful literal
colnames(ABV_ST) <- c("State","ABV") 
ABV_ST
#### Summary function will give the 5 point summary statistics of the variable given as argument
summary(ABV_ST)

## Bar Chart to show Median ABV in various states
#### ggplot function is used to get the bar chart where x axis is the state and y axis is Median ABV.ggtitle gives the heading/title to the bar chart
#### xlab and ylab is the xlabel and ylabel to the x&y axis repectively
#### geom_bar creates the bar plot and the lining is yellow.The xaxis texts were colliding and hence adjusted the text to flip to 90deg
p <-ggplot(ABV_ST, aes(ABV_ST$State, ABV_ST$ABV))
p +geom_bar(stat = "identity",colour="YELLOW") + theme(axis.text.x=element_text(angle=90,hjust=1)) + xlab("State") + ylab("Median ABV") + ggtitle("ABV Vs State") 


## Bar chart Inference: 
### There is little variation across all the states in median Alcohol  by volume. It is almost equal. This can be seen from the bar chart and also by the summary statistics. The minimum is 0.04 for the state of UT and maximum is 0.06 for the state of DC,KY,NV,MI,NM,OK,CT,CO,SD,WV  

## Median International bitteness Unit for each state
#### aggregate function is used to get the median value of IBU group by state.na.rm is set to TRUE to remove the NA observations and then get the median value
IBU_ST<-aggregate(merge_df$IBU ~ merge_df$State, data = merge_df, median,na.rm=TRUE)
#### Setting the column names of the derived dataframe to a meaningful literal
colnames(IBU_ST) <- c("State","IBU")
IBU_ST
#### Summary function will give the 5 point summary statistics of the variable given as argument
summary(IBU_ST)

## Bar Chart to show median IBU in various states
#### ggplot function is used to get the bar chart where x axis is the state and y axis is Median IBU.ggtitle gives the heading/title to the bar chart
#### xlab and ylab is the xlabel and ylabel to the x&y axis repectively
#### geom_bar creates the bar plot and the lining is yellow.The xaxis texts were colliding and hence adjusted the text to flip to 90deg
q <-ggplot(IBU_ST, aes(IBU_ST$State, IBU_ST$IBU))
q +geom_bar(stat = "identity",colour="YELLOW") + theme(axis.text.x=element_text(angle=90,hjust=1)) + xlab("State") + ylab("Median IBU") + ggtitle("IBU Vs State") 


## Bar chart Inference: 
### There is variation across the states in median IBU. This can be seen from the bar chart and also by the summary statistics. The minimum is 19 for the state of WI and maximum is 61 for the state of ME 

# 5. State having max alcoholic beer
#### which.max function gives the maximum value of the variable passed as argument.
alc<-merge_df[which.max(merge_df$ABV),]
#### prints the entire row for the max value of ABV
alc
#### find the column positions to get the column position
str(alc)
#### Based on the column position,print state and ABV
alc[c(4,7)]

### State of Colorado (CO) with ABV = 0.128

## State with Most bitter beer
#### which.max function gives the maximum value of the variable passed as argument.
bitter<-merge_df[which.max(merge_df$IBU),]
#### prints the entire row for the max value of IBU
bitter
#### Based on the column position,print state and IBU
bitter[c(4,8)]

### State of Oregon (OR) with IBU = 138

# 6. Summary Statistics for ABV
#### summary function gives the 5 point summary stats. We see that there are some NAs.
summary(merge_df$ABV)
## After removing NAs
#### Since there are some NAs , use na.omit to remove the NAs and print the sumamry stats again
abv_n<-na.omit(merge_df$ABV)
summary(abv_n)


# 7. Relationship between Bitterness and Alcoholic content
#### na.omit removes the NA observations before plotting to avoid misleading results.
merge_df1 <- na.omit(merge_df)
#### ggplot function is used to get the bar chart where x axis is the ABV and y axis is IBU.ggtitle gives the heading/title to the bar chart
#### xlab and ylab is the xlabel and ylabel to the x&y axis repectively
#### geom_point creates the scatter plot and the color chosen is Red. geom_smooth is used to draw a line along the observation points .
#### Since the method chosen is lm (linear method) it draws a 45deg linear line across the plot to show the linear regression. Color of the line is chosen to be BLUE
ggplot(merge_df1 ,aes(x=merge_df1$ABV, y=merge_df1$IBU)) + geom_point(shape=20, color="RED") +geom_smooth(method='lm',color="BLUE") + xlab("Alcohol By Vol") + ylab("International Bitterness Unit") +
  ggtitle("Bitterness Vs Alcohol Content") 
