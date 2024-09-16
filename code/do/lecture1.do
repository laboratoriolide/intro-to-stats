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

import delimited "C:\\Users\\user\\Documents\\GitHub\\intro-to-stats\\data\\supercias_raw.csv", numericcols(20) clear 

* The code above makes column 20 (capital suscrito) numerical

********************************************************************************
* Univariate Descriptive Stats
********************************************************************************

summarize capital_suscrito, detail // Various descriptive stats

tab capital_suscrito // A frequency table, not too useful for numerical variables

* For the coefficient of variation:

egen m = mean(capital_suscrito)
egen s = sd(capital_suscrito)
gen cv = s / m

* Percentiles with pctile (can only define number of divisions)

pctile capital_suscrito_quart = capital_suscrito, nq(4)
return list

* Zscore

generate zscore = capital_suscrito - m/s

* if you made a mistake in the generation of the new variable, overwrite using replace

* replace zscore = capital_suscrito - m/s

sktest capital_suscrito

********************************************************************************
* Finish
********************************************************************************

exit
