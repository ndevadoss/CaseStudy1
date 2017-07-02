# Data Reading
Nithya Devadoss  
July 1, 2017  
#Data Dictionary:
##Beers data file has 2410 observations and 7 columns: 

##Beers.csv: 
###Name: Name of the beer. 
###Beer ID: Unique identiﬁer of the beer
###ABV: Alcohol by volume of the beer. 
###IBU: International Bitterness Units of the beer. 
###Brewery ID: Brewery id associated with the beer. 
###Style: Style of the beer. 
###Ounces: Ounces of beer.

##Breweries data file has 558 Observations and 4 columns

##Breweries.csv: 
###Brew ID: Unique identiﬁer of the brewery. 
###Name: Name of the brewery. 
###City: City where the brewery is located. 
###State: State where the brewery is located.

## Reading Files 
## Added na.strings to convert blanks to NA for easy data cleanup

```r
library(readr)
Beers <- read.csv("C:/Nithya/MSDS/Term1/6306_Doing_DS/Week7/CaseStudy/Download/Beers.csv",header=T,na.strings="")
Breweries <- read.csv("C:/Nithya/MSDS/Term1/6306_Doing_DS/Week7/CaseStudy/Download/Breweries.csv",header=T,na.strings="")
```
##Sample Beer data and number of observations
## Beers data file has 2410 observations and 7 columns

```r
str(Beers)
```

```
## 'data.frame':	2410 obs. of  7 variables:
##  $ Name      : Factor w/ 2305 levels "#001 Golden Amber Lager",..: 1638 577 1705 1842 1819 268 1160 758 1093 486 ...
##  $ Beer_ID   : int  1436 2265 2264 2263 2262 2261 2260 2259 2258 2131 ...
##  $ ABV       : num  0.05 0.066 0.071 0.09 0.075 0.077 0.045 0.065 0.055 0.086 ...
##  $ IBU       : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ Brewery_id: int  409 178 178 178 178 178 178 178 178 178 ...
##  $ Style     : Factor w/ 99 levels "Abbey Single Ale",..: 18 17 15 11 15 79 17 21 17 11 ...
##  $ Ounces    : num  12 12 12 12 12 12 12 12 12 12 ...
```

```r
head(Beers)
```

```
##                  Name Beer_ID   ABV IBU Brewery_id
## 1            Pub Beer    1436 0.050  NA        409
## 2         Devil's Cup    2265 0.066  NA        178
## 3 Rise of the Phoenix    2264 0.071  NA        178
## 4            Sinister    2263 0.090  NA        178
## 5       Sex and Candy    2262 0.075  NA        178
## 6        Black Exodus    2261 0.077  NA        178
##                            Style Ounces
## 1            American Pale Lager     12
## 2        American Pale Ale (APA)     12
## 3                   American IPA     12
## 4 American Double / Imperial IPA     12
## 5                   American IPA     12
## 6                  Oatmeal Stout     12
```
#Sample Breweries data
## Breweris data file has 558 Observations and 4 columns

```r
str(Breweries)
```

```
## 'data.frame':	558 obs. of  4 variables:
##  $ Brew_ID: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Name   : Factor w/ 551 levels "10 Barrel Brewing Company",..: 355 12 266 319 201 136 227 477 59 491 ...
##  $ City   : Factor w/ 384 levels "Abingdon","Abita Springs",..: 228 200 122 299 300 62 91 48 152 136 ...
##  $ State  : Factor w/ 51 levels " AK"," AL"," AR",..: 24 18 20 5 5 41 6 23 23 23 ...
```

```r
head(Breweries)
```

```
##   Brew_ID                      Name          City State
## 1       1        NorthGate Brewing    Minneapolis    MN
## 2       2 Against the Grain Brewery    Louisville    KY
## 3       3  Jack's Abby Craft Lagers    Framingham    MA
## 4       4 Mike Hess Brewing Company     San Diego    CA
## 5       5   Fort Point Beer Company San Francisco    CA
## 6       6     COAST Brewing Company    Charleston    SC
```
