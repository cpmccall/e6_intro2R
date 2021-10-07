#Exercise #5

#Practice the following skills:
  # reshape data frames
  # if_else statements

#Part 1: version control --------------------------------------------
# Please track changes to your script using version control. Include in your homework the URL to your completed homework assignment available on your
#GitHub repository
setwd("C:/Users/Friend Computer/Desktop/e6_intro2R")

#Part 2: reshaping data frames ---------------------------------------------

#Using the 'batting.2008.Rdata' dataset, please do the following

#1) Using the spread() function, please create a data frame that shows the total number of home runs (HR) for each birthYear (rows)
#for each team (columns)
head(dsub)
row.names(dsub)=dsub$birthYear
dspread=spread(data=dsub,key="teamID", value="HR")

#2) Subset the data for the Houston Astros (HOU). Using the gather() function, create a new data frame that has 3 columns:
  # (1) playerID, (2) variable containing (AB, R, H, 2B, 3B) and (3) column with the corresponding values for the stats.
head(d)
str(d)
dsub2=subset(d, subset=teamID=="HOU", select=c("playerID","AB","R","H","2B","3B"))
head(dsub2)
dgather=gather(data=dsub2,key="play_result",value="play_amount",c("AB","R","H","2B","3B"))
head(dgather)
#3) Repeat the process for Question 2. However, this time, please use the melt() function from the 'reshape2' package.
library(reshape2)
dmelt=melt(data=dsub2,play_result=c("AB","R","H","2B","3B"))
head(dmelt)

#4) Using the dcast() function from the 'reshape2 package', find the mean number of AB, R, H, 2B, 3B for each player (use 'playerID' to aggregate).
ddcast=dcast(data=dmelt, formula=playerID+variable~"mean", fun.aggregate=mean)
head(ddcast)
#Part 3: if_else statements -------------------------------

# one condition
#5) generate an if_else statment to test if the value of a numeric object is positive number
n=-1
if(n>0) {print("Positive number")} else {print("Intruder detected")}

#6) using the two objects below, please generate an if_else statement that uses logical operator (i.e, !=, ==, >, etc.)
  # in the test

    x <- 5
    y <- 8
if (x!=y) {print("x is not equal to y")} else {print("x is equal to y")}
#7) Hamlet's quandry: In Shakespeare's play Hamlet, the lead character has a famous speech "to be or not to be".
browseURL("https://www.poetryfoundation.org/poems/56965/speech-to-be-or-not-to-be-that-is-the-question")
# Write an if_else statement using the "to be' or 'not to be' for outcomes of the 'yes' and 'no' arguments respectively.
if ("to be"==Yes) {("not.to.be"=No)} else {("not.to.be"=Yes)}
#two or more conditions
#8) create an 'if else' statement that returns (in order of preference) your four ideal pizza toppings

if (askYesNo("Is life worth living")==TRUE) {print("to be")} else {print("not to be")}
#two or more conditions joined (new content)
#To join two or more conditions into a single if statement, use logical operators viz. && (and), || (or) and ! (not).

  #example:
  x <- 7
  y <- 5
  z <- 2
  if(x > y && x > z) {
    print("x is greater")
  }

#9) generate your own 'if' statement using multiple conditions in one line

if(askYesNo("Do you like pineapple on pizza?")==TRUE && askYesNo("Do you like cats")==FALSE) {print("We can't be friends")}

#New content: understanding a common warning/error message when using if_else.
# The follow set of code will generate a warning message. Explain in a comment what the warning is telling you.
  v <- 1:6

  if(v %% 2) {
    print("odd")
  } else {
    print("even")
  }
length(v)
# 'v' is a character vector of length greater than one. However, in the case of this function, only the first value of the 
##vector will be used. In this case, the first value of the vector is one. Rather than running the operation for numbers 1:6,
### which would generate multiple answers the function will only run the operation (1 %% 2), which will give only one answer.