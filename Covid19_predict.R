#imports
library("leaps")
library("car")

################ --- Project 2 --- ###################

datatest1 <- read.csv("/Users/Matt/Downloads/Proj2_data.csv") #loads all data

#cleans data
specificregoin <- datatest1
specificregoin$State = NULL
specificregoin$Row.Labels = NULL
specificregoin$hospitlized= NULL
specificregoin$on.icu= NULL
specificregoin$recoverd = NULL

#model without variable selection
model1 <- lm(summer_tot_deaths~., data = specificregoin)
summary(model1)

#stepwise variable selection
summary(step(model1, direction="both", scope=~.))

#best subsets variable selection
best_subsets <- regsubsets(summer_tot_deaths~., data = specificregoin)
plot(best_subsets, scale = "r2")
plot(best_subsets, scale = "Cp")

#Selected model
model1 <- lm(formula = summer_tot_deaths ~ Spring_death + num_poverty + 
               num_hosp_beds + Pop_.abv_65 + media_salary, data = specificregoin)

#summary 
summary(model1)


#####Tests for assumptions######

res <- residuals(model1) #saves residuals of the chosen model

#QQ Plot
qqPlot(res, ylab ='Residuals', main='Normal Probability Plot', pch=19, col='blue', xlab='Theoretical Quantiles')
# The QQ plot shows that most data points stay within the 95% CI. There are a few points outside
#of the CI interval, but not enough to invalidate the entire model. This upholds the normality assumption. 

# Test for independence of residuals
# residuals vs. order plot
plot(res, xlab='Observation Order', ylab='Residuals', pch=19, col='blue', main = 'Residuals vs Order')
abline(0,0,lwd=3,col='red')
#There is a random scatter across the x-axis indicating the independence of residuals assumption is upheld.

# Test for Linearity and Homoscedasticity. 
plot(res~predict(model1), pch=19, col='blue',main='Residuals vs Fitted', ylab='Residuals', xlab='Fitted Values')
abline(0,0,lwd=3, col='red')
#There is an obvious grouping of the data points, which violates the linearity and homoscedasticity assumptions. 

#Plot to check fit 
plot(predict(model1, newdata = specificregoin), specificregoin$summer_tot_deaths,xlab='Fitted Values', ylab='Observed', pch=19, col='blue', main = 'Fitted Values vs Observed')
abline(0,1,lwd=3, col='red')
#The model appears to fit the data quite well. 

#Because the model violates linearity and homoscedasticity assumptions, the model is
# considered to be invalid.

# Check VIF values 
vif(model1)
