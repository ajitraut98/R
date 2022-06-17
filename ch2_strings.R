# ch2_strings

s1 = 'c'; typeof(s1)
s2 = 'learning R'; typeof(s2)
s1 = "C"; typeof(s1)
s2 = "learning r"; typeof(s2)

# length of the string
nchar(s2)

# character vector
days=c('monday','tuesday','wednesday','thursday','friday','saturday','sunday')

# total number of elements
length(days)

# length of each string in the vector
nchar(days)

print(days)

# covert the char vector into a categorical data
days1 = as.factor(days)
days1
levels(days1)
nlevels(days1)

# describe the data
str(days1)

# accessing the char vector

days[1] # 1st element
days[1:3] # 1st 3 elements
days[c(2,5)] # 2nd and 5th element

# starting from 1st element, get all the alternate elements
# without hardcoding
days[seq(1,length(days),2)]

# concatenating strings
str1="my name is"
str2 = "sriraman"
paste(str1,str2,sep=" ")

# handling NA in char vector
days=c(days,NA,NA,NA)
days

# get the actual number of elements (excluding NA)
# method 1
length(days) - length(days[is.na(days)])

# method 2
length(days[!is.na(days)])
length(days[is.na(days)==F])

# install.packages("stringi",dependencies = T)
# install.packages("stringr",dependencies = T)
library(stringi)
library(stringr)

# string operations
str3 = "   R programming  "

# length of the string
str_length(str3)
nchar(str3)

# remove spaces
str_trim(str3)

# convert to upper case
toupper(str_trim(str3))

# lower case
tolower(str3)

# pattern matching
lov=c('jayesh','sanjay','delhi','agra','jayaram','pune','mouse','pointer')

lov
lov[grep(tolower("Jay"),lov)]

# exact match
which(lov == "jay")

# word count
para1="machine learning is making predictions. machine does not learn on its own. a machine does not think. machine is like a black box"

# count the number of occurances of the word 'machine'
ctr = str_count(para1,"machine")

print(paste("the word 'machine' occurs", ctr,"times"))

# check if a sentence has a start pattern
# returns True if yes, else False
startsWith(para1,"train") # false
startsWith(para1, "mac") # true

# check for ending pattern
endsWith(para1,"machine") # false
endsWith(para1,"box") # true

# substring - extract a portion of a string
substring(para1,1,10) # 1st pos till 10th pos
substring(para1,20,35) # 20-35th pos

# character translation
sent2="An Apple A Day keeps the Doctor Away"
# replace A with E
sent2 = chartr("A","E",sent2)

sent2

# find/replace word in a sentence
sent3='the house is very old. the house owner does not stay here. this house was last used 10 years back.'

# replace 'house' with 'property'
gsub('house', 'property',sent3)

# split a line of record based on a delimiter into individual columns
rec="194~sriraman~24~data scientist~pune"
strsplit(rec,"~")

# generating random strings
stri_rand_strings(10,5,"[A-Za-z0-9]")

# logical vector
flag = c(T,F)
flag[1]
flag[2]