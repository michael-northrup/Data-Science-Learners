##################################################
## Hypothesis Testing: One sample: Right tailed t-test, left tailed t-test,
## two tailed t-test, two-sample t-tests
##################################################

##################################################
##  The process:
##
##  1. Specify the null and alternative hypothesis
##
##  2. Using the sample data and assuming the null hypothesis is true, 
##     calculate the value of the test statistic. (Varies depending on test)
##
##  3. Using the known distribution of the test statistic, calculate the P-value
##     (This is done using programs like R now, previously it was done by looking
##      it up in a table)
##
##  4. Set the significance level, alpha, the probability of making a Type I error to
##     be small - 0.01, 0.05, or 0.10. Compare the P-value to alpha. If the P-value is
##     less than (or equal to) alpha, reject the null hypothesis in favor of the 
##     alternative hypothesis. If the P-value is greater than alpha, you fail to reject 
##     the null hypothesis.
##################################################

##################################################
## Right Tailed T-Test
##################################################

##################################################
## An engineer measured the Brinell hardness of 25 
## pieces of ductile iron that were subcritically annealed.
## The resulting data were:
##################################################

data.a = c(170,167,174,179,179,
           156,163,156,187,156,
           183,179,174,179,170,
           156,187,179,183,174,
           187,167,159,170,179)

##################################################
## The engineer hypothesized that the mean Brinell hardness 
## of all such ductile iron pieces is greater than 170. Therefore,
## he was interested in testing the hypotheses:
##
## H0 : mu = 170
## HA : mu > 170
##################################################

t.test(data.a,alternative = "greater",mu=170)

##################################################
## Do we reject the null hypothesis?
## What does that mean?
##################################################


##################################################
## Left Tailed T-Test
##################################################

##################################################
## A biologist was interested in determining whether sunflower 
## seedlings treated with an extract from Vinca minor roots resulted 
## in a lower average height of sunflower seedlings than the standard
## height of 15.7 cm. The biologist treated a random sample of n = 33 
## seedlings with the extract and subsequently obtained the following heights:
##################################################

data.b = c(11.5,  11.8,   15.7,   16.1,   14.1,   10.5,
           15.2, 	19.0, 	12.8, 	12.4, 	19.2, 	13.5,
           16.5, 	13.5, 	14.4, 	16.7, 	10.9, 	13.0,
           15.1, 	17.1, 	13.3, 	12.4, 	8.5, 	  14.3,
           12.9, 	11.1, 	15.0, 	13.3, 	15.8, 	13.5,
           9.3, 	12.2, 	10.3) 	  	 

##################################################
## The biologist's hypotheses are:
##
## H0 : mu = 15.7
## HA : mu < 15.7
##################################################

t.test(data.b,alternative = "less",mu=15.7)

##################################################
## Do we reject the null hypothesis?
## What does that mean?
##################################################

##################################################
## Two Tailed T-Test
##################################################

##################################################
## A manufacturer claims that the thickness of the spearmint gum 
## it produces is 7.4 one-hundredths of an inch. A quality control 
## specialist regularly checks this claim. On one production run,
## he took a random sample of n = 10 pieces of gum and measured their 
## thickness. He obtained:
##################################################

data.c = c(7.65, 	7.60, 7.65,	7.70,	7.55,
           7.55,	7.40,	7.40,	7.50,	7.50)

##################################################
## The quality control specialist's hypotheses are:
##
## H0 : mu = 7.4
## HA : mu != 7.4
##################################################

t.test(data.c,mu=7.4)

##################################################
## Do we reject the null hypothesis?
## What does that mean?
##################################################


##################################################
## Two-Sample T-Test
##################################################

##################################################
## 6 subjects were given a drug (treatment group) and an additional 
## 6 subjects a placebo (control group). Their reaction time to a 
## stimulus was measured (in ms). We want to perform a two-sample 
## t-test for comparing the means of the treatment and control groups.
##################################################

treatment = c(101, 110, 103, 93, 99, 104) 
control = c(91, 87, 99, 77, 88, 91)

##################################################
## Let mu1 be the mean of the treatment population and 
## mu2 the mean of the control population. Here the hypothesis 
## of interest can be expressed as:
##
## H0 : mu1 = mu2
## HA : mu1 != mu2
##################################################

t.test(treatment,control, var.equal=TRUE)
t.test(treatment,control)

##################################################
## Do we reject the null hypothesis?
## What does that mean?
##################################################


##################################################
## Others: Chi-squared, paired t-test, tests of proportion
##################################################


##################################################
## Data was taken from 
## https://onlinecourses.science.psu.edu/statprogram/node/139
## http://www.stat.columbia.edu/~martin/W2024/R2.pdf
##################################################