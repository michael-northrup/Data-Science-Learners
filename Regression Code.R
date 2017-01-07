##################################################
## Regression
##################################################

##################################################
## The idea:
## Take a set of data and draw the line that most closely fits.
## Purpose: Predict new values based on the linear model.
##################################################
setwd("Data Science/Presentation")

##################################################
## Single Variable Example:  GNP Data
##################################################

## Importing data/Getting names
econ.data = read.csv("longley.csv")
names(econ.data)

## Plotting Year vs GNP
plot(econ.data$Year,econ.data$GNP, main = "Year vs GNP",xlab = "Year", ylab = "GNP",las=1,col = "Brown")

## Creating Linear Model and fitting it to the graph
econ.lm = lm(GNP~Year, data=econ.data)
abline(econ.lm, col = "Blue")

## Closer look at linear model
summary(econ.lm)
econ.lm

2016*20.78-40223.76
##################################################
## Multi-Variable Example:  Boston Housing Data
##################################################
library(MASS) 
library(lattice)
data(Boston)
names(Boston)
?Boston

full.lm = lm(medv~crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat,data=Boston)
summary(full.lm)

## Variable selection Methods, ie how do we choose what matters?
## My goal:  Exaplain as much of the variation with as few variables as possible

###########################################
## I examined the level of correlation between 
## medv and the other variables and removed variables where the
## absolute value of the correlation was less than .4  I then did 
## a backwards selection method where I remove the variable witht the highest
## p-value until all variables are stastically significant at a level of .05
## This left the following variables:
## rm, ptratio, and lstat
###########################################
## Two way relationships/Scatterplot matrix
round(cor(Boston),2)
summary(lm(medv~indus+nox+rm+tax+ptratio+lstat, data = Boston))
summary(lm(medv~rm+tax+ptratio+lstat, data = Boston))
summary(lm(medv~rm+ptratio+lstat, data = Boston))

###########################################
## Visualization of the remaining variables
###########################################
medv = Boston$medv
rm = Boston$rm
ptratio = Boston$ptratio
lstat = Boston$lstat

plot(medv,rm,las=1)
abline(lm(rm~medv))

plot(medv,ptratio,las=1)
abline(lm(ptratio~medv))

plot(medv,lstat,las=1)
abline(lm(lstat~medv))


###########################################
## Check for interactions between variables:
## I removed unnecessary columns from the data
## and ran another correlation matrix.
###########################################
newVariables = c("rm","ptratio","lstat")
Boston.new = Boston[newVariables]
round(cor(Boston.new),2)
pairs(Boston.new,las=1)

###########################################
## Interaction models were now tested
###########################################
lm(medv~rm+ptratio+lstat+rm*ptratio+rm*lstat+ptratio*lstat, data = Boston)
summary(lm(medv~rm+ptratio+lstat+rm*ptratio+rm*lstat+ptratio*lstat, data = Boston))


###########################################
## Other models were now tested
###########################################
Boston.new["rmsquared"]=Boston["rm"]^2
Boston.new["ptratiosquared"]=Boston["ptratio"]^2
Boston.new["lstatsquared"]=Boston["lstat"]^2

summary(lm(medv~rm+ptratio+lstat+rm*ptratio+rm*lstat+ptratio*lstat+rmsquared+ptratiosquared+lstatsquared, data = Boston.new))

finalModel = lm(medv~rm+ptratio+lstat+rm*ptratio+rm*lstat+ptratio*lstat+rmsquared+lstatsquared, data = Boston.new)
summary(finalModel)


###########################################
## Diagnositc Graphs (Can't graph directly as with single variable models)
###########################################
plot(finalModel)

###########################################
## More information on these diagnostic plots can be found here:
## http://data.library.virginia.edu/diagnostic-plots/
###########################################
