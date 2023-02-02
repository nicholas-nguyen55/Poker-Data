# Poker-Data
Introduction and Background

Poker is a card game where players wager on who has the best combination of 5 cards . Bluffing is a strategy successful poker players engage in. It is an act of deception aimed at making your weak hand look stronger than it is with the intent of getting your opponent to fold. The goal of bluffing is to win irrespective of the hand you have been dealt. Here we apply our data science skills to answer questions around bluffing. Previous reports have studied to see if bluffing can be predicted by reviewing body language and facial imagery for “tells”. Attempts included taking thermal images of players faces, scrapping face data from televised poker games, and sensors that detect moisture in players hands 
Here, we take a look at historic poker datasets and consider them for bluffing statistics by applying data science. The datasets employed in the exploration came from historical poker hands of human vs human Kaggle.com [1], historical poker hands of human vs an AI (Pluribus) Kevinwang.com [2] and odds data from betandbeat.com [3]. The group considered these large datasets to examine the effectiveness of bluffing.

Pluribus: Analysis 1
Data Dictionary

●	Dataset [2] Human Vs AI (Pluribus) 491 ((17 attributes and 491 observations (pulled one group of players)).

●	Originally a log format:

![image](https://user-images.githubusercontent.com/113401627/216461019-8cd1e350-e771-46a0-8667-588996232f5b.png)

●	Transformed Fields 
Column
Description

Game
id of the game

Winner
name of winner

B.Blinder
player who is big blind

B=W
was the blinder the winner?

Bluff?
was the winning hand a bluff?

R.W.Odds
rounded odds of the winner

Pot
size of the pot

Flop
flop hand

Turn
turn hand

River
river hand

Has Flop
game has a flop?

Pluribus
AIs hand

Bill
Bill hand

Eddie
Eddie hand

Budd
Budd hand

Gogo
Gogo hand

MrWhite
MrWhite hand

