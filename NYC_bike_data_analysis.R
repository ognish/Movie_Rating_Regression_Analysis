
library(dplyr)
library(statsr)
library(ggplot2)
library(psych)



bike_data<- read.csv("/Users/apple/Desktop/Data_Cycle/NYC-CitiBike-2016.csv")

boxplot(tripduration~usertype, ylim=c(0,4000))

bike_data %>%
  group_by(usertype) %>%
  summarise(mean_trip=mean(tripduration))

summary(aov(tripduration~usertype))

bike_data %>%
  group_by(gender, usertype) %>%
  summarise(mean_trip=mean(tripduration))


first_trip=head(bike_data,1)
first_trip

bike_data %>%
   group_by(gender) %>%
   filter(birth.year=="1960")%>%
   summarise(mean_trip=mean(tripduration))
