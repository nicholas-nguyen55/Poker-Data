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

Column Description

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

Business Questions

Historic porker datasets were examined to answer some questions on the data when it comes to bluffing. Did players bluff more vs an AI or Human? Does the Pot or Flop affect bluffing? Was bluffing a good idea (did they earn chips)? When is the best time to bluff (blind, flop, river)? Who Bluffs the most? Can we predict when a game will be won with a bluff? 

Cleanup and Preparation 

Datasets from the above sources were merged from text and csv files then used to pull in odds and used to create a bluff column for each game in order to answer our questions about the data. The [2] dataset was parsed from a log format and hand data cleaned up for pulling in the correct odds. Unwanted characters were removed. Columns that were not needed to answer the questions we had were dropped. Data was also checked for any unnecessary data, irregular data or outliers. 

Methods of Analysis

With this new data we ran comparative reports using pivot tables and calculated statistics including wins and bluff wins by player, total hands won by bluffing including when there was a flop or not, who was the big blind, and considering the size of the pot. Finally, we ran a SVM model to see if a bluff could be predicted in the game.

Comparison of Humans and AI:

Bluffing occurred more vs humans 62% of the time vs 27% of the time but equal seat dataset analysis is needed since players appear to bluff a lot more when 3 players were in a game vs 6 players.  We tried to extrapolate the seats by merging in different odds at different seat counts but the amount of error introduced was too great. 

![image](https://user-images.githubusercontent.com/113401627/216461273-5441b26b-8f7a-4b7f-a463-000663b08e95.png)

As for the flop data and pot analysis we concluded from the stats above, bluffing occurred less when a flop was shown as which leads to the notion that bluffing occurs more pre-flop (68%/45% of bluffs had a flop vs 71%/56% of non-bluffs had a flop). Pots were 61%/45% smaller on average during bluffing wins leading to increased pot size making players hesitant to bluff.

Player Results (dataset 2)

![image](https://user-images.githubusercontent.com/113401627/216461473-68a33833-6089-4844-9433-13cb78461e31.png)
![image](https://user-images.githubusercontent.com/113401627/216461509-346ff916-df72-4f56-b567-3b1485c602da.png)

SVM Model (Model 1)

We ran a model using an SVM algorithm on the Pluribus dataset to see if we could predict when a game would be won by a bluff. We used the following fields for the algorithm: winner, the blind, pot size, flop and Bluff? as the factor field. We use 70% of the dataset for training and 30% for predicting. The accuracy was calculated at 74% running a confusion matrix. This model could be improved with player and flop hand analysis but it's already surprising how powerful machine learning can be.

SVM Model (Model 2)

We ran a second model to see if we could predict if a player would bluff again after winning a hand with a bluff. We used the following fields for the algorithm: Total Games, Total Wins, Bluff Wins, Non-Bluff Wins, and Bluff Percentage. The accuracy was calculated using another confusion matrix at only 25%. This could be improved upon on the basis that the data seems inconclusive with a such a low result. Analyzing further data about the probability of bluffing could possibly make this model more effective. Looking at card data could improve this model by including what cards are dealt when a player bluffs.

Conclusions:

Bluff analysis like this is useful to poker players for improving their own skills. They can see performance stats to know how much they should bluff and even, with the right algorithms, predict when a game could include a bluff. Indicators like their hand, flop, pot size, table size and who is the blind can inform players when bluffing is more common. Knowing the best and worst combination of hands can help players when they have those cards. Looking at the results we got, it is a real advantage players can have to hone in their knowledge of bluffing via data science. Imagine how powerful a future phone app can be that reads all the available data about the game and suggests to players if they should fold or raise. With the advancement of machine learning and AI, the future for games of skill may need vast countering of AI algorithms and thorough cheat detection. 

Pluribus: Analysis 2

Business Questions

At what round is best to win and earn the most money? What round do most players win? Which round did players bet/raise/call the most money and which round did they least?

Cleanup and Preparation 

As shown in the first analysis, the game data was sourced from multiple text files. The total number of text files that could be used from KevinWang’s Pluribus work was 92 text files. However, some text files contained a different set of 6 players. In order to have consistency in our analysis, only four Pluribus text files were utilized, which were text files ending in 100,101,102, & 103.

The four text files were read by R and each line is stored into a dataframe called df. 

![image](https://user-images.githubusercontent.com/113401627/216461614-0b8d2555-ccb6-4a56-832a-1f72ed6024dc.png)

Pluribus (df)

Because each game had different outcomes, multiple data frames were needed to be made. So for the first read through of df in R, only lines that were constant in every game was stored in the dataframe, df2 with each row comprising of one poker hand, its table session, the player names for seat1-6, players who were smallBlind & bigBlind for that current game, the cards for all 6 players, and game’s total pot.
 
![image](https://user-images.githubusercontent.com/113401627/216461703-105f5637-149c-404e-9933-41d8b7e9dcc4.png)
![image](https://user-images.githubusercontent.com/113401627/216461715-ecc2d13d-89a0-486c-b96e-2012e0ab7ad7.png)

Pluribus (df2)

In order to include the historical data of each game, each line was then read by R and for each player move done in each round, it was stored into a dataframe called df3. 

![image](https://user-images.githubusercontent.com/113401627/216461826-c67751fe-22ba-468f-92b3-5fe09bc70e34.png)

Pluribus (df3)

Rows that contained the status “collected” meant the player had won the game and collected the pot so by filtering out the rows that contained the status “collected” in df3, another dataframe was made named dfWinner.

![image](https://user-images.githubusercontent.com/113401627/216461882-aef346e4-ec12-49fc-8b80-8dd79238476f.png)

Pluribus (dfWinner)

Methods of Analysis

The main focus in this analysis is what is happening during each round in the game. 
With the help of masterData1, first, the sum() function was used to see how many games finished at what round (i.e. sum(masterData1$winningRound == "flop"). The results from those sums were then use to calculate its percentage compared to the entire dataset (rounded to the 2nd decimal place)

Round	Count	Percentage

hole	140	46.82%
flop	47	15.72%
turn	33	11.04%
river	33	11.04%
showdown	46	15.38%

Out of the 299 games examined, almost half (49.82%) ended at the hole round.
The next thing to examine is the amount called/raised/bet/returned in each round. To do this, sub-data frames were made from masterData2 by filtering data by its round column. The aggregate() function was used to calculate the min, mean, and max by each status type. 

	Call
Round	mean	minimum	maximum
hole	237.06	50	1100
flop	453.73	100	1925
turn	783.89	110	2650
river	1003	0	6825

Looking at the call data table’s maximum values, the highest call amount was done during the river round. The purpose of calling is to match a bet or raise and the table clearly shows that as such. The maximum average mean is $1003, which also happened during the river round.

	Raise
Round	mean	minimum	maximum
hole	471.04	200	10000
flop	1043.22	450	1640
turn	1956.25	1000	3800
river	1587.50	500	3750

In poker, raising the pot not only helps with increasing the pot size but also cuts the game short, if you raise high enough that the opponent gets scared and folds. Based on the table above, we can see that the maximum value raised was $10000, which is the total amount of money each player could have each game. 

	Bet
Round	mean	minimum	maximum
hole	NA	NA	NA
flop	408.21	100	1925
turn	719.05	100	3174
river	1119.49	0	6825

In the bet table, the entire hole round there are no values because there is no betting allowed in this round. Only the moves fold, raise, check and call are present in the round. Like the call data, the maximum bet amount happened during the river round. 
In masterData1, the summary function was applied onto each pot round. For example, summary(masterData1$holePot) was used to get the data in the first row of the table below. 

Round	minimum	1st Quartile	median	mean	3rd Quartile	maximum
hole	0	225	350	653	575	13800
flop	0	0	0	232.80	242.5	3850
turn	0	0	0	246.30	0	5300
river	0	0	0	421.70	0	13650
total	100	250	500	1150	1000	21350

Excluding the total pot, the highest maximum pot in each round is during the hole round at $13,800 while the river comes in second at $13,650. Also when looking at the rounds’ average values. We can see that the hole round has the highest average of $653 and the river round has the second highest of $421.70. From this, we can therefore conclude that the best round to win the most money is during the hole round. 
Next, masterData2’s columns: pokerHand, holePot, flopPot, turnPot, riverPot, and totalPot were used as a sub-data frame for linear modeling, which will be used to test how the different types of moves affect the pot size. 
The outcome variable or the dependent variable of the model will be totalPot while the predictors or independent variables of the model will be the different pot sizes per round: holePot, flopPot, turnPot, and riverPot.
First, multiple bi-variate scatter plots were made for each  predictor vs the outcome variable.


