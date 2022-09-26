library (tidyverse)
library (dplyr)
library (data.table)
library(ggplot2)

oneDollarSpin <- read.csv("C:/Users/user/Documents/IST 687 INTRO\\one_dollar_spin_and_go - one_dollar_spin_and_go.csv")

#Following 3 lines clean up csv
oneDollarSpin2 <- oneDollarSpin
options(dplyr.summarise.inform = FALSE)
oneDollarSpin2 [oneDollarSpin2 == 'x'| oneDollarSpin2 == '--'] <- NA

#Making all_in binary with 1 being true and 0 being false
oneDollarSpin2$all_in <- ifelse(oneDollarSpin2$all_in == 'TRUE', 1,0)

#Amount of hands that won
winners<- oneDollarSpin2 %>% filter(result == 'won')%>%nrow()
winners
#10,772

#Amount of hands that took home chips
tookChips<- oneDollarSpin2 %>% filter(result == 'took chips')%>%nrow()
tookChips
#31,087

#Amount of hands that gave up
gaveUp<- oneDollarSpin2 %>% filter(result == 'gave up')%>%nrow()
gaveUp
#50,728

#Amount of hands that lost
lost<- oneDollarSpin2 %>% filter(result == 'lost')%>%nrow()
lost
#10,028

#Shows everyhand results as well as bet amounts for the hand being played
Hands <- oneDollarSpin2 %>% 
  group_by(cards) %>%
  summarize(across(c(stack, pot_pre, pot_flop, pot_turn,pot_river,
                     ante, blinds, bet_pre, bet_flop, bet_turn, bet_river,
                     result, balance), na.rm=TRUE))

#Percentage of hands won, took chips, gave up, and lost
totalHands <- sum(with(oneDollarSpin2, table))

winningPercentage <- (winners/totalHands) * 100
#10.5%

tookChipsPercentage <- (tookChips/totalHands) * 100
#30.3%

gaveUpPercentage <- (gaveUp/totalHands) * 100
#49.4%

lostPercentage <- (lost/totalHands) * 100
#9.7%

#group by function to create dataframe of all actions taken for each hand 
Actions <- oneDollarSpin2 %>%
  group_by(cards) %>%
  summarize(across(c(position,action_pre, action_flop, action_turn, action_river,
                     all_in, result) ,na.rm=TRUE))

#Use aggregate function to figure out the average balance result of each 
#specific card hand
aggResults <- aggregate(balance~cards, oneDollarSpin2, mean, na.rm=TRUE)
aggResults

#Use aggregate function to figure out the asym total balance result of each 
#specific card hand
aggResultsSum <- aggregate(balance~cards, oneDollarSpin2, sum, na.rm=TRUE)
aggResultsSum

#Got rid of cards that were not related to our data
aggResults2 <- aggResults %>% slice(-c(2245, 2246, 2451, 2452, 2453, 2454, 
                                       2455, 2456, 2457, 2458, 2561))

aggResultsSum2 <- aggResultsSum %>% slice(-c(2245, 2246, 2451, 2452, 2453, 2454, 
                                       2455, 2456, 2457, 2458, 2561))


#lowest and highest average earning cards
minCards <- aggResults2[which.min(aggResults2$balance),]
minCards
#Ah Th -200

maxCards <- aggResults2[which.max(aggResults2$balance),]
maxCards
#Ks Kh 323.8

#Lowest and Highest earning cards 
minSumCards <- aggResultsSum2[which.min(aggResultsSum2$balance),]
minSumCards
#4d 4s -4075

maxSumCards <- aggResultsSum2[which.max(aggResultsSum2$balance),]
maxSumCards
#Ks Kh 8095

#edit plot more clearly
install.packages('scales')
library('scales')
scatte <- ggplot(aggResults2) +
  geom_point(aes(x=cards, y=balance))+
  theme(axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

scatte

startplot <- starts_with(2)

#Looking into all in data
Allin <- oneDollarSpin2%>%count(oneDollarSpin2$all_in)
Allin
#0 = 88402
#1 = 14213

aggAllinResults <- aggregate(all_in~result, oneDollarSpin2, sum, na.rm=TRUE)
aggAllinResults

Allin$results <- oneDollarSpin2$results


allindata <- oneDollarSpin2 %>% 
  group_by(cards) %>%
  summarize(across(c(all_in, result, balance), na.rm=TRUE))

allinT <- allindata$all_in == 1
allinT

allin1<- allindata %>% filter(result == 'won')%>%nrow()
allin1
