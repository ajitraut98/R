# ch1: numbers



age = 40
print(age)
typeof(age)

# data type conversion from 'double' (default) to 'integer'
age = as.integer(age)
typeof(age)

# method 2: to make a datatype as 'int'
age = 45L
print(age)
typeof(age)

# number / numeric vector
# c-> combine
v1 = c(19,20,54,39,75)
print(v1)
typeof(v1)

# total elements in the vector
length(v1)

# accessing the elements of a vector
# using the index position
# index in R starts from 1
v1[1] # first value
v1[2] # second value

# range of values
v1[1:4] # first 4 values

# get values from index 2,4,5
v1[c(2,4,5)]

# arithmetic operations
v1[1] + v1[2]
sum(v1)
mean(v1)
median(v1)

# adding new values to the vector v1
v1 = c(v1,c(100,101,102))
v1

# add new elements 50,60,65,99 to v1
v1=c(v1,c(50,60,65,99))
v1

max(v1)
min(v1)

# to find the number of digits in a number
# nchar(1000000000000)
nchar(522.89)

# dealing with NULL values
v1 = c(v1,NA,NA,NA)
v1

sum(v1) # returns NA

# ignore Null values from calculations
sum(v1,na.rm = T)
max(v1,na.rm=T)
round(mean(v1,na.rm=T),1)

# range of numbers
seq(1,10) # 1-10
seq(1,20,3) # start=1,end=20,stepsize=3

# table of 7
v2 = seq(7,7*10,7)
print(v2)

# reverse sequence
seq(20,1,-4)

# float number sequence
seq(1.5,4.5,0.38)

# random numbers
# 10 random float numbers between 5 and 22
v3=round(runif(10,5,22),2)
v3

# sorting the vector
# ascending sort (default)
sort(v3)

# descending sort
sort(v3,decreasing = T)

# sampling technique
# without replacement (default)
v4=sample(seq(1,30),25)
sort(v4)

# with replacement
v5=sample(seq(1,30),25,replace=T)
sort(v5)

# create 100 employee ID's for a company. range is 1000-9999
# store result in a vector 'empid'

# arithmetic operators and functions
10 + 34.8
98-32.8
10*4*3.1
45/3.01

# power
5**3 # 5x5x5

# quotient
19%/%4

# remainder
19%%4

# absolute
abs(-10.903)
-1*-10.903

# log
n = 14.28
log(n) # natural log (base e)
log(n,2) # base 2
log(n,10) # base 10

# square root
sqrt(144)
sqrt(4.41)

# i) create a vector of 20 integers (1-100)
# ii) add 5% to each value

# changing values in a vector
v4[1] = v4[1] + 10
v4[1]

# to change Null values
# change NA to 0
v1[is.na(v1)] = 0
v1

# replace the 0's with the mean value of the vector
v1[v1==0] = round(mean(v1),1)
v1

# which()
# select all the values that are more than 20
which(v5>20)

# get the actual value
v5[which(v5>20)]

# A1) create a vector of 50 integers between 1-999.
v6 = sample(seq(1,999),50)
v6

# Extract only the 1/2/3 digit numbers
v6[which(nchar(v6)==1)]
v6[which(nchar(v6)==2)]
v6[which(nchar(v6)==3)]

# append values to vector
v7 = c() # empty vector

# appending values
v7=append(v7,c(10,20))
v7=append(v7,c(11,88))
v7

# unique values
v8=sample(seq(1,6),20,replace=T)
sort(v8)
sort(unique(v8))

# identify which numbers are getting duplicated

v9=sample(seq(10,15),10,replace=T)
v9
duplicated(v9)

# index where duplicates occur
which(duplicated(v9))

# values that are duplicating
unique(v9[which(duplicated(v9))])

# how many times the numbers are repeating
table(v9)

# rank
marks=c(75,49,84,63,91,70)

# lowest value gets rank 1
rank(marks)

# highest value gets rank 1
rank(-marks)

# order
# returns the position of the data (in the increasing order)
marks
order(marks)

# repeating a value
rep(101,3)

# repeating a sequence
rep(1:5,2)

# repeating a pattern
rep(c(31,30),2)

# repeating days in months
days=rep(c(31,29,30),c(7,1,4))

# data type conversion
# float -> int
n = 19.345
as.integer(n)
floor(n)

# number -> string
as.character(n)

# remove elements from vector
# use -<index position>
v1[-1]

# removes values from index positions 2,4,6,8
v1[-c(2,4,6,8)]



