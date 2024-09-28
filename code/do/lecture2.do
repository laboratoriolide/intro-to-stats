/* 
Introduction to Statistics
Young Researchers Fellowship
September 2024

*/

* This script perform further descriptive analyses on the SUPERCIAS dataset.

********************************************************************************
* Preliminaries
********************************************************************************

clear
version 18
set more off
capture log close

* set working directory

cd "C:\\Users\\user\\Documents\\GitHub\\intro-to-stats"

* Load data

import delimited "C:\\Users\\user\\Documents\\GitHub\\intro-to-stats\\data\\supercias_raw.csv", numericcols(20) clear 

* The code above makes column 20 (capital suscrito) numerical

********************************************************************************
* Univariate Descriptive Stats - Categorical Data
***************************************************************************

* Perform a frequency table for the region variable. 

tab region 

********************************************************************************
* Dealing with binary or dummy variables
***************************************************************************

* Generate a dummy

gen sierra_dummy = 0
replace sierra_dummy = 1 if region == "Sierra"

tab sierra_dummy

* can also quickly generate dummies with

tab region, gen(region_dummy)

* these are later included in statistical analyses

* if we want to transform back, use gen as well

gen sierra_categorical = "Otras provincias"
replace sierra_categorical = "Region Sierra" if sierra_dummy == 1

* Work with sierra as a categorical variable (i.e. a factor) using the i. suffix
* this can be similar to R factors, but needs preprocessing steps

encode region, gen(region_num)

* Equivalent to working with factors

* this wont work: reg capital_suscrito region_num

* this will work:

reg capital_suscrito i.region_num

********************************************************************************
* Measures of association
***************************************************************************

* load the cars dataset

sysuse auto, clear

// Calculate covariance

corr price mpg, covariance

// Calculate correlation

corr price mpg

// Calculate correlation matrix for multiple variables (also works with covariance)

corr price mpg weight length

// Contingency table for two different categorical variables

tab foreign rep78, col 

// Col is for making it percentages, otherwise it will only be counts

********************************************************************************
* Stats data viz
***************************************************************************

* Histogram

histogram price

* boxplot

graph box price

* cumulative distribution

// Generate cumulative distribution data
cumul mpg, gen(cum_mpg)

// Plot the cumulative distribution
twoway line cum_mpg mpg, sort ytitle("Cumulative Probability") ///
xtitle("Miles per Gallon (mpg)") title("Cumulative Distribution of mpg")

* scatter plot

scatter mpg weight


exit