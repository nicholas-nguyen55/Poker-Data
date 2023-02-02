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

![image](https://user-images.githubusercontent.com/113401627/216462387-61dc5421-a01e-455a-9ab0-5a4e6f0f833e.png)


Out of the 299 games examined, almost half (49.82%) ended at the hole round.
The next thing to examine is the amount called/raised/bet/returned in each round. To do this, sub-data frames were made from masterData2 by filtering data by its round column. The aggregate() function was used to calculate the min, mean, and max by each status type. 

![image](https://user-images.githubusercontent.com/113401627/216462427-209cf78b-0b85-4926-b604-70d0d5757fbd.png)

Looking at the call data table’s maximum values, the highest call amount was done during the river round. The purpose of calling is to match a bet or raise and the table clearly shows that as such. The maximum average mean is $1003, which also happened during the river round.

![image](https://user-images.githubusercontent.com/113401627/216462506-e443dfeb-3bc5-4806-bedf-58b78574f0f0.png)


In poker, raising the pot not only helps with increasing the pot size but also cuts the game short, if you raise high enough that the opponent gets scared and folds. Based on the table above, we can see that the maximum value raised was $10000, which is the total amount of money each player could have each game. 

![image](https://user-images.githubusercontent.com/113401627/216462549-5ee58de4-36f8-4fe2-9b79-3e6ea49f8e1f.png)


In the bet table, the entire hole round there are no values because there is no betting allowed in this round. Only the moves fold, raise, check and call are present in the round. Like the call data, the maximum bet amount happened during the river round. 
In masterData1, the summary function was applied onto each pot round. For example, summary(masterData1$holePot) was used to get the data in the first row of the table below. 

![image](https://user-images.githubusercontent.com/113401627/216462598-3bc5f476-8f04-41ec-a0fb-20612f1de44e.png)


Excluding the total pot, the highest maximum pot in each round is during the hole round at $13,800 while the river comes in second at $13,650. Also when looking at the rounds’ average values. We can see that the hole round has the highest average of $653 and the river round has the second highest of $421.70. From this, we can therefore conclude that the best round to win the most money is during the hole round. 

Next, masterData2’s columns: pokerHand, holePot, flopPot, turnPot, riverPot, and totalPot were used as a sub-data frame for linear modeling, which will be used to test how the different types of moves affect the pot size. 

The outcome variable or the dependent variable of the model will be totalPot while the predictors or independent variables of the model will be the different pot sizes per round: holePot, flopPot, turnPot, and riverPot.

First, multiple bi-variate scatter plots were made for each  predictor vs the outcome variable.

![image](https://user-images.githubusercontent.com/113401627/216462642-58f2409d-5c6c-4311-a411-eb119341cdd8.png)
![image](https://user-images.githubusercontent.com/113401627/216462662-4660e433-2d84-4516-80ab-1806b5a580b3.png)

When looking at the 2 plots: holePot vs totalPot and flopPot vs totalPot, there is no significant correlation.

![image](https://user-images.githubusercontent.com/113401627/216462694-950bc15b-46b7-4db2-8191-aea602fec256.png)
![image](https://user-images.githubusercontent.com/113401627/216462712-630dc0ae-33e4-473e-bcc9-25338d13ae63.png)

When looking at the two plots: turnPlot vs totalPlot and riverPlot vs totalPot, there is a slight correlation between the 2. There is also a linear trend but it is very faint. 

Linear modeling was then use to verify our observations. The lm() function was coded as follows: lm(formula = df9$totalPot ~ holePot + flopPot + turnPot + riverPot, data=df9) and stored into a variable multiReg. Then the summary() was run to see the model’s results.

![image](https://user-images.githubusercontent.com/113401627/216462767-a95b0467-9ebf-42dd-b037-07cae9b74f23.png)


The adjusted Rsquared is 0.9042, which tells us the results have a variance of 9042%. Based on the summary, the coefficients that are positively significant are as follows: holePot = 0.42, flopPot=1.07, turnPot = 0.73, riverPot = 0.95 and b intercept = 42.23. All the predictors are statistically significant based on their p-values being less then 0.05.  

Conclusion	

Based on our second analysis, the hole round is when most players won and surprisingly, it is also most ideal round to win money. This is when players should exhibit their best bluffing skills in order to win the most money. 

For future studies, I recommend trying to apply associative rules with the two datasets: masterData1 and masterData2. It would be interesting to see the following: 
●	relationship between the different cards dealt to players vs. the different poker moves (call/raise, etc.) 
●	relationship between the different cards dealt to players vs. the money called/raised/bet per round


One Dollar Comparison (Kaggle Data)

Business Questions

What was the percentage of players winning or losing a hand? Which card combinations given to players were the highest and lowest earning? How did players fare when they went all in?

Cleaning and Organization

For this data set there was not much that needed to be cleaned up, but some that needed to be changed. In areas where there was no data in, the original set put either ‘X’s’ or ‘--’. In order for everything to be the same and run the code easier, we changed all of the empty cells into ‘NA’. This helped out tremendously as we wanted to create multiple data frames in order to get a clearer idea of how player results turned out. I also had to turn the all-in data into binary 1 and 0. Originally they had True as going all in and False as not going all in. But I changed that to True = 1 and False = 0. 

Next, we created a data frame to organize every single hand played and get the bet amounts that they made called Hands. The data frame includes the results of the hand played and the amount of chips they either won or lost. Following that we created a follow up data frame to include the actions that were taken from each player to see if they called, raised, checked or folded called Actions. This will give whoever views this data set an easier way to look at what each player did for each turn of a card. 

![image](https://user-images.githubusercontent.com/113401627/216462972-e2054434-2588-407d-b2cb-2fb335207768.png)

Hands (Kaggle DF1)

![image](https://user-images.githubusercontent.com/113401627/216462991-cc1601bc-d69b-4b22-85a9-704a829c7d4c.png)

Actions (Kaggle DF2) 

The last data frames created for this data set were all aggregated. We wanted to do this in order to see how each individual card combination fared against each other. This combines all similar cards into 1 and we can get a complete result of how each card did. There are 2 sets of aggregate that would need to be done in order to get a sense of how the combination of cards did. One was to get the average of each card combination and how they fared, and the second was to get the sum balance of each card combination. With these new aggregated data frames, you can look up any card combination to see the average and total earnings. 

![image](https://user-images.githubusercontent.com/113401627/216463050-3d436036-2ad9-4c6d-a094-ac1d06113a76.png)

Average Aggregate (Kaggle DF3)

![image](https://user-images.githubusercontent.com/113401627/216463076-980c7a91-f108-4b4d-811c-209f5615192f.png)

Sum Aggregate (Kaggle DF4)

After aggregating the results, we saw that there was data in the “cards” section that we did not want. In order to get the proper analysis we had to get rid of those combinations as follows. 

![image](https://user-images.githubusercontent.com/113401627/216463122-edf5dff2-23b3-42f3-a606-6452fa7f7853.png)

Analysis

The first item we wanted to analyze within this data was the results of each hand and how many times those results happened. 

![image](https://user-images.githubusercontent.com/113401627/216463180-6df05170-4183-4857-901d-78477be697d5.png)

As you can see there were more times when a player lost overall (Gave Up, Lost) than actually taking any chips at the end of a round. 

Next we wanted to see which card combinations were the best and worst to have. The first chart below shows which card combination averaged the lowest and highest earning chips PER HAND. Without surprise a pair of Kings average to be the best combination to start with for any player averaging 323.8 chips won if you got that hand. While surprising though is the lowest average hand being an Ace and 10 (T). With both cards considered to be high, I was surprised to see that this was the lowest average card combination. This could be a sign that while they do not have a pair to start, they have a strong hand but eventually lose out when other players start having better combinations as more cards are turned over. Also that players will continue to bluff with higher cards and no combinations rather than lower starting cards. 

![image](https://user-images.githubusercontent.com/113401627/216463233-806d0c42-c76d-41ac-9550-1473efa8a860.png)

We add the graph below as well to show the average amount of each card combination possible. The lowest cards that start with 2 are on the left and go all the way to the end on the right are cards that started with Kings or K. Along the Y-Axis balance refers to the amount a player on average won or lost with that card combination. The further along you go on the scatter plot you can see that the higher cards took on average more chips. With a better starting hand players can be more aggressive without having to hesitate about bluffing. 

![image](https://user-images.githubusercontent.com/113401627/216463260-aa64a56d-557e-457b-a19a-ed4d81b6493a.png)

Balance Scatter Plot 


The following chart shows the lowest and highest combined TOTAL EARNINGS of card combinations. The lowest being a pair of 4s which could be surprising but also unsurprising at the same time. A pair being the one of the lowest winning combinations you can have, can result in not much happening if you decide to keep playing it. Thus resulting in some players losing at the end of the round going in with one of the lowest pairs at. But considering it is still a pair, it is somewhat surprising a non paired hand was not a lower earning than the pair of 4s. This could prove that players are unlikely to bluff and risk their chips with a lower starting hand. The highest earning is no surprise, similar to the average stated above a pair of kings is the highest earning card combination out of all combinations. 

![image](https://user-images.githubusercontent.com/113401627/216463318-3c7c367c-1f12-402a-a629-d5ca605052be.png)

The last analysis we wanted to look into was the All In data. How many times did players go all in and what were the results any time they did? Switching the data to binary for the all_in column is what made this process easier. We found that players only went all in 14,215 times which was only 13.8% of the hands played. 

![image](https://user-images.githubusercontent.com/113401627/216463359-feb34976-91dc-45e8-9a83-57662943dc24.png)

Conclusions

Players who went all in more than likely came out on top combining Took Chips and Won, 71.3%. Going all-in is a high risk, high reward tactic. It can be considered a great bluff move if the player has nothing and wants to risk all of their chips to get the other player to fold. But if they are bluffing and their opponent calls them, their chances of winning are slim. 

After doing a comparison analysis for our Kaggle dataset, we can conclude that having a higher starting hand that already has a combination to win was obviously the best start. Players did not need to bluff and can play a more aggressive style against their counterparts. Although having a great starting hand did not always mean they won, as you can see from the scatter plot that the higher starting hands also had some of the lowest balance. 

