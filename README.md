# multivariate-linear-regression

## Introduction

The goal of this project was to create a multiple linear regression model to estimate the number of COVID-19 deaths in the summer by state. To generate this model I gathered the Data.csv dataset which contains a row for each of the 46 states I could find data on, and columns for statistics on each state such as the number of hospital beds, the median salary, total deaths in the spring, etc. Links to the resources I used to compile this dataset can be found in the Resources section at the bottom of report.pdf file.


## Covariates

| Variable | Description |
| --- | --- |
| num\_poverty | The number of people below the federal poverty threshold in each state |
| num\_hosp\_beds | The number of hospital beds available in each state. |
| num\_lungs\_death | The number of lung related deaths in 2019 |
| Pop\_ abv\_65 | The number of people in each state older than 65 |
| media\_salary | The median salary in each state |
| population | The population of each state |
| pop\_density | The population density for each state |
| recovered | The total number of people that recovered by the beginning of summer |
| Spring\_death | The total number of deaths during spring. This helps with adjusting the data since not all states got their first infection at the same time. |


## Files 
Data.csv: includes 46 observations each coresponding to a single state.                                                                                             
Covid19_predict.R: includes all the calculations and visualisations.      
Report.pdf: includes the results.
