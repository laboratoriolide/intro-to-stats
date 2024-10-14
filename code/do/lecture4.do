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
* Sampling data
********************************************************************************

* Preserve the original dataset

preserve

* set seed

set seed 12345

* Randomly sample 10% of the data

sample 10

* (10 is the percentage of the data to be sampled)

* Restore so I can resample

restore

* Re-preserve since I will sample again.

preserve

* Sampling a specific number of observations

sample 100, count

restore

********************************************************************************
* Normal distribution
********************************************************************************

display normal(2)

display normalden(3)

display normalden(3,1,0.5)

display invnormal(0.46)

* Calculate descriptive stats for probabilities later

egen mean_supercias = mean(capital_suscrito)

egen sd_supercias = mean(capital_suscrito)

egen N_supercias = count

egen se_supercias = sd_supercias/sqrt(N_supercias)

* Get normal cdf for the sampling distribution of the mean

display normal((mean_supercias - mean_supercias)/se_supercias)

