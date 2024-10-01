
* This script perform further descriptive analyses on the LAPOP dataset.

********************************************************************************
* Preliminaries
********************************************************************************

clear
version 18
set more off
capture log close

* set working directory

cd "C:\\Users\\user\\Documents\\GitHub\\intro-to-stats"

* import dataset

use "data\\lapop 2019\\Ecuador LAPOP AmericasBarometer 2019 v1.0_W.dta"


********************************************************************************
* Stats data viz
********************************************************************************

* Boxplot

graph box q2

* Scatter

scatter l1 q2

* Use the .gph files to reproduce a graph. it will give you the code that you need for 
* seeing what is the syntax for graphs.

* You may create complex graphs as follows:

scatter l1 q2, title("Titulo del Boxplot") subtitle("LAPOP 2019") 

* To produce a chart for only a filtered version of the data, use if

* however, be sure to check the label list

label list q1_es

scatter l1 q2 if q1 == 1 // not sure why it didn't work during the lecture

* A twoway plot for a cumulative distro (check the other script)
