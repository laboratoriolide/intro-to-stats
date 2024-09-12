/* 
Introduction to Statistics
Young Researchers Fellowship
September 2024

*/

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

import delimited "C:\Users\user\Documents\GitHub\intro-to-stats\data\supercias_raw.csv", numericcols(20) clear 

* The code above makes column 20 (capital suscrito) numerical

********************************************************************************
* Univariate Descriptive Stats
********************************************************************************

summarize capital_suscrito, detail

********************************************************************************
* Finish
********************************************************************************

exit