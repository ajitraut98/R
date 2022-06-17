# ch9: Dataframes

# file name: mybankcustomers.csv (created during our python session)

# read a CSV file
path = "F:/work/mybankcustomers.csv"

# read the file into a dataframe
cust=read.csv(path, header=T)
print(cust)

# to view the data in an XL format
View(cust)

# basic EDA
head(cust) # returns the first 6 records
head(cust,3)

tail(cust,3) # last 3 records

# dimension
dim(cust)

# names of columns
colnames(cust)

# row names
rownames(cust)

# get the row and column count
nrow(cust)
ncol(cust)

# structure of the dataset
str(cust)

# some columns are showing the wrong datatype. Need to convert them into the right data type

# gender,city,privcust,acctype,srcit = string->factor
cust$gender = as.factor(cust$gender)
cust$city = as.factor(cust$city)
cust$privcust = as.factor(cust$privcust)
cust$acctype = as.factor(cust$acctype)
cust$sr_citz = as.factor(cust$sr_citz)

# verify the change
str(cust)

# summarise the dataset
summary(cust)
summary(cust$age) # summary of a single column

# rename a column
colnames(cust)
# rename 'cards' to 'totalcards'
colnames(cust)[colnames(cust)=="cards"] = "totalcards"

# retrieve data from dataframe
# select * from customer
print(cust)

# select custid,name,age,gender,phone from cust
# method 1
cust[,c('custid','name','age','gender','phone')]

# method 2
cols=c('custid','name','age','gender','phone')
cust[,cols]

# method 3
cust[cols]

# accessing a single column - using the $ sign after df
cust$acctype

# filter data from dataframe
# select * from customer where custid = 12752
cust[cust$custid==12752,]

# select personal info of customer id 12752
cust[cols][cust$custid == 12752,]
cust[cust$custid==12752,cols]

# IN operator
# select customers whose ID's are (12752,10801,16664)
colnames(cust)
cid=c(12752,10801,16664)
cols=c('custid','acctype','balance','crscore','privcust')
cust[cust$custid %in% cid,cols]

# select all female customers having a credit score more than 600
cols=c('name','gender','crscore')
cust[(cust$gender=="F") & (cust$crscore>=600),cols]

# select all customers having a credit score more than 700 OR bank balance more than 750000
cols=c('name', 'crscore', 'balance','gender')
cust[(cust$crscore>700) | (cust$balance>750000), cols]

# get a count, proportion of customers based on the account type

# count
table(cust$acctype)

# proportion of customers
round(prop.table(table(cust$acctype))*100,1)

# get all customers whose acctype is not INR
# select * from cust where acctype <> INR
cols=c('custid','name','acctype')
cust[cust$acctype!="INR", cols]

# get customers whose email contains 'gmail'
cols=c('name','email')
cust[grep("gmail", cust$email),cols]
# this is case-sensitive search

# case-insensitive search
cust[grep("GMaiL", cust$email, ignore.case = T),cols]

# sorting the dataset
# select * from cust ORDER BY crscore
# default order: Ascending
cust[with(cust, order(crscore)),]

# descending order
cols=c('name','acctype','crscore')
cust[with(cust,order(crscore,decreasing=T)),cols]

# accessing dataframe by row numbers
cust[c(1,2,3),]

# creating and removing columns from dataframe
# create
cust$lastname = ''
cust$lastdeposit = 0

# drop features from dataframe
cust$lastname = NULL
cust$lastdeposit = NULL

# update the dataframe

# update the name and email ID of customer ID 12752 with the right values

cust$name[cust$custid == 12752] = "sriraman"
cust$email[cust$custid == 12752] = "sriraman@crscompany.in"

# verify the change
cols=c('custid','name','email')
cust[cust$custid==12752,cols]

# check for 0 and Nulls

# create functions
checkZero=function(x) return(any(x)<=0)
checkNull=function(x) return(any(is.na(x)))

# apply this function on the dataframe

# check for NULLs
# return cols that have Nulls
names(cust)[apply(cust,2,checkNull)]

# method 2
colSums(is.na(cust))

# check for 0
names(cust)[apply(cust,2,checkZero)]
# 0 check is applicable only on the numeric columns

# method 2
colSums(cust==0)

# get the numeric and factor columns

# numeric cols
nc=names(cust)[sapply(cust,is.numeric)]

# factor cols
fc=names(cust)[sapply(cust,is.factor)]
fc

# to identify the levels of all factor columns
for(f in fc)
{
  print(paste("factor column = ",f))
  print(levels(factor(cust[[f]])))
  print(" ... ")
}

# method 2 - get all values with their counts
for(f in fc)
  print(table(cust[f]))

# .................................... #

# Visualisation
# --------------------

library(ggplot2)

# install.packages("ggplot2", dependencies=T)

# histogram
hist(cust$crscore,col='yellow',breaks=10,main='Histogram for Credit Score',xlab='Credit Score')


# boxplot
boxplot(cust$balance,col='blue',horizontal = T,
        main='Boxplot')

# scatter plot
plot(cust$age, cust$crscore,col='green')

# bar plot
barplot(cust$crscore,main='Distribution of Customers')

# plot count of customers based on acct type
ggplot(cust,aes(x=acctype,fill=acctype)) + 
  geom_bar() +
  ggtitle('Customer Distribution by Account type')

# Pie Chart - distribution of customers by acc type
ggplot(cust, aes(x=factor(''),fill=acctype)) +
  geom_bar() +
  coord_polar(theta = "y")

# histogram - by Gender and Age
ggplot(cust,aes(x=age,fill=gender)) +
  geom_histogram(binwidth = 10) + 
  ggtitle('Histogram')

# split the above graph
ggplot(cust,aes(x=age,fill=gender)) +
  geom_histogram(binwidth = 10) + 
  ggtitle('Histogram') +
  facet_wrap(~gender)

# density plot
ggplot(cust,aes(x=crscore)) + geom_density()

# density plot for Male/Female
ggplot(cust,aes(x=crscore,fill=gender)) + 
  geom_density(adjust=0.1)

# line chart
ggplot(cust,aes(x=age,y=balance)) + geom_line()