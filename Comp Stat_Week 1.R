#COMP STAT lectures 1 & 2 (Week 1)

### Pretend to add comment to the code. - Sara 06/08/23

install.packages("datasets")
library(datasets)
data(infert)
dim(infert) #248 rows and 8 columns

?infert
#data comes from fertility study with a total of 248 female participants. If infertile (case) if fertile (control).
head(infert)

# Are there ANY na's in the data set? 
any(is.na(infert))

infert[c(2,3,7),c(2:4)]
#display row 2, 3, and 7 and corresponding columns, 2-4. 
#way to access the matrix 

#3 kinds of variables: factor (categorical), numeric, and integer. 

sapply(infert, class)
#"simple apply" 

summary(infert[,1:6])
#remove the last two columns "stratum" and "pooled stratum" from the summary function

var(infert[,2:6])
#variance function: call it with the column only and it will calculate the variance and covariance between variables. 

round(var(infert[,2:6]),2)
#round function applied to the variance function for better reporting of variance table

round(cor(infert[,2:6]),3)
#round fxn applied to correlation function 

str(infert)
#structure function: describes your dataset 

#collapse the "induced" variable into a binary variable: 0=no induced abortions, 1=at least one induced abortion 
#ifelse function will be used 

DAT=infert[,-c(7,8)]
head(DAT)
#remove the last two columns and create a new object

class(DAT)
#should say data frame (not a matrix because unable to call out columns with headers)

DAT$age
#access specific column 
DAT$sex
#does not exist so output is "NULL"

DAT$induced1=ifelse(DAT$induced==0,0,1)
#ifelse (if true, value will be 0, if not 1)
?ifelse

head(DAT)
head(DAT,10)

DAT$spontaneous1=ifelse(DAT$spontaneous==0,0,1)
DAT[1:10,]

x= c(6:-4)
x
sqrt(x)  #- gives warning
sqrt(ifelse(x >= 0, x, NA))

## Note: the following also gives the warning !
ifelse(x >= 0, sqrt(x), NA)

class(DAT$induced1)
#numeric is correct

DAT$IndSpo <- ifelse(DAT$induced1 == 0 & DAT$spontaneous1 == 0, 0, ifelse(DAT$induced1 == 0 & +
                                                                            DAT$spontaneous1 == 1, 1, ifelse(DAT$induced1 == 1 & DAT$spontaneous1 == 0, 2, 3)))
DAT[1:10, ]

MyData <- c(1:4)
MyData1 <- c("Bon Jour", "Bon Soir", "Adieu", "Bon Appetit")
MyData

MyData2 <- LETTERS[1:4]
MyData2

MyData3 <- data.frame(MyData, MyData1, MyData2)
MyData3
#create column names for the data frame 

MyData5 <- matrix(c(1:12), nrow = 4)
MyData5

rownames(MyData5) <- c("Brenda", "Glenda", "Miranda", "Melinda")
colnames(MyData5) <- c("Lenny", "Johnny", "Denny")
MyData5
#must create row and column names to apply to the matrix

MyData6 <- c(1:12)
dim(MyData6) <- c(3, 2, 2)
#3 rows, 2 columns, and 2 slices (3rd dimension)
MyData6

rownames(MyData6) <- c("Glenda", "Yolanda", "Hacienda")
colnames(MyData6) <- c("Benny", "Ronny")
MyData6
class(MyData6)
#array because it is three dimensional 

MyData6 <- c(1:12)
dim(MyData6) <- c(3, 2, 2)
dimnames(MyData6)[[1]] <- c("Glenda", "Yolanda", "Hacienda")
dimnames(MyData6)[[2]] <- c("Benny", "Ronny")
dimnames(MyData6)[[3]] <- c("Oceans", "Skies")
MyData6
#rename the slices of the array 

#### Lecture 2 - YouTube Instructional Videos #### 

getwd()
#get working directory 

list.files()
#list the files in your working directory 

setwd("/Users/saraburcham/Desktop/R and SAS Data")
#set a new working directory for files to be saved

list.files()
#list the files of the new working directory

sqrt(16)
#square root of value 

factorial(4)
log(4)
#if you don't specify the base, it will be natural log. 
#play around with R fxns 

x ==4
#conditional checking, is x = 4? 
x

ls()
#shows how many objects you have created. Mine is a long list because I never clear them out:) 

#### Ideas for sf-36 QE/Dissertation committee members (CCHMC)
#Joseph M. McDonald
#Sheila T. Angeles-Han
#Thomas H. Inge
#Meg Zeller
#Judy Bean 
#Avani Modi
#Maninder Kalra
#Stavra Xanthakos
#Rosemary Miller
#Rachel Akers
#K. Nicole Weaver, MD
#Hadas Nahman-Averbuch
#Robert C. Coghill

#Access elements of a vector or matrix:
v=c(1:20)
v
v[3]

length(v)
tail(v)
head(v)

fruit=c("apple", "banana", "orange", "pineapple")
nchar(fruit)
#count the number of characters in each element of the text vector 

nchar(fruit) <7
#Ask R if the characters in the fruit vector are less than 7 characters long

#Boolean vectors refers to TRUE/FALSE (binary) outcomes 

b=c(10,20,30)
b+1
c=b+1
c
#add values to vectors and then save as an object 

seq(0,20,5)
#input a sequence from 0-20 in increments of 5 

matrix(v, ncol=4)
#create a matrix manually 

matrix(1:100, ncol=10, nrow=10, byrow=TRUE)
#create a matrix manually and add a byrow fxn to direct R to fill up the matrix 

MAT=matrix(1:100, ncol=10, nrow=10, byrow=TRUE)
dim(MAT)
head(MAT)
tail(MAT)
#can describe the size of the matrix in the same way as a vector

MAT[2:10, 1:5]
#extract from specific parts of the larger matrix 

### Computational Stats - WEEK 2 - Lecture 3 - Work through notes on our own

data(infert)
dim(infert)
head(infert)
infert1= infert[ , -c(7, 8)] 
dim(infert1)
head(infert1)
sapply(infert1, class)
#sapply tells R to apply something to every variable in the dataset. Here, we just want to know the class type for each variable.
infert1$induced1 <- as.factor(infert1$induced)
infert1$spontaneous1 <- as.factor(infert1$spontaneous)
summary(infert1)
#Can see how changing the induced variable into a factor variable makes it easier to run the summary variable
#as.numeric is the opposite - change a factor variable into a numeric variable.
EduCase= table(infert1$education, infert1$case) 
#table function is R is similar to PROC FREQ command in SAS
EduCase
round(prop.table(EduCase, 1), 2)
#Calculate the proportions row by row. Round the numbers to two decimal places. If you change the "1" to a "2" then it will tell it to add up to 1 (100%) by column.
#When writing manuscripts, your first two tables of descriptive analysis should include:
  #1) Table of counts (TABLE fxn) & missing data counts
  #2) Proportional Table (PROP.TABLE fxn)
  #3) Scatter plot/histogram/ box plot or other descriptive graph 
#This should always be done prior to reporting p-values. 

InduceCase= table(infert1$induced1, infert1$case) 
InduceCase

Case= subset(infert1, infert1$case == "1")
dim(Case)
#Subset the data set where the case is =1 (has had a spontaneous abortion)

Control= subset(infert1, infert1$case == "0")
dim(Control)

#Homework #1 is posted online & must use R Markdown 














