setwd("C:/Users/mgangwar/Desktop/Python")

rm(list=ls())
#required libraries
library(ggplot2)
library(tidyr)

#reading data
stroopdata <- read.csv("stroopdata.csv")

str(stroopdata)

#solution to question 3, descriptive statistics   
summary(stroopdata)
sd(stroopdata$Congruent)
sd(stroopdata$Incongruent)

#reshaping data to create boxplot to see distribution
reshaped_stroop <- gather(stroopdata, "Condition", "Time",1:2) #reshape the dataset

#creating visualizations for question 4
theme_set(theme_classic())
# Plot
g <- ggplot(reshaped_stroop, aes(Condition, Time))
g + geom_boxplot(varwidth=T, fill="plum") + 
  labs(title="Box plot", 
       subtitle="Response Time by Condition of words",
       x="Congruity Condition",
       y="Response Time")

g <- ggplot(reshaped_stroop, aes(Time, fill = Condition))  
g +   geom_histogram(binwidth = 2,alpha = 0.6, position = 'identity',color = 'red')+
  xlab('Response Time') +
  ylab('Frequency') +
  ggtitle("Histogram: Response Time Distribution")

#performing t-test to  test hypothesis
t.test(
  stroopdata$Congruent, stroopdata$Incongruent, paired = TRUE,
  alternative = "less", var.equal = FALSE
)


