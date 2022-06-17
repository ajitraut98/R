# ch6: programming in R

# if-statement/ if-else / if-elseif-else

# loops
# for, while, repeat

# operators
# .........................

# if statement
# check if a person is having a temperature (>98.8)
temp = 89.7

if(temp > 98.8)
  print("Person has fever")

# if-else
if (temp > 98.8)
  print("Person has fever") else
  print("Person is normal")

# block with multiple lines of code
# use {}
# check if a person is qualified to write a test
age = 12

if (age < 18)
{
  print("not qualified to write test")
  print("Reason: underage")
  print(paste("your age now is",age))
} else
{
  print("qualified for the test")
  print("the exam date will be announced soon")
  print("good luck")
}
ss
# if-else if
# criteria for qualification
# "A" -> passed with distinction
# "B" -> passed with diploma
# "C" -> did not pass
# any other value -> invalid data

rank = "a"

if (toupper(rank) == "A")
  print("Distinction") else
if (toupper(rank) == "B")
  print("Diploma") else
if (rank == "C")
  print("Did not pass") else
  print("invalid data")

# check if a number is a 3 digit number or not
num = 286

if (nchar(num)==3)
  print(paste(num,"is a 3-digit number")) else
  print(paste(num,"is not a 3-digit number"))


# logical AND/OR/NOT
# AND
if( (num>100) & (rank == "a") )
  print("superior quality product") else
  print("reject the product")

# OR
if( (num > 100) | (rank == "b") )
  print("high corruption score") else
  print("low corruption score")

# NOT (!=)
if (rank!= "a")
  print("product not in demand") else
  print("product in high demand")

######

# loops in R

# create a vector of numbers and iterate over it 
# add 5% to every value and print

v1 = sample(seq(11,99),20)

# method 1 -> get the values directly from object
for (e in v1)
{
  print(paste("Value =", e))
  print(paste("New value = ",e + (0.05*e)))
}

# add 5 to every element
# method 2 -> get values using index
for (e in seq(1,length(v1)))
{
  print(paste("Old value = ", v1[e]))
  print(paste("new value = ", v1[e]+5))  
}

# while loop
# generate 10 random names
n=1

while(n < 11)
{
  name = stringi::stri_rand_strings(1,5,"[a-z]")
  print(paste("name",n," = ", name))
  n=n+1
}

# repeat loop
n=1
repeat
{
  print(paste("number=",n))
  n=n+1
  
  if(n > 6)
    break
}

# user input
value = readline("Enter a word :")
print(paste("user entered ", value))


# check if a number is present in a vector/list

lst1 = list(19,3,10,45,22,67)
19 %in% lst1
100 %in% lst1

# assignment
# 1) 
# create 2 lists (list1 and list2) with random integers
# check if every number in list2 exists in list1. If not, then add the number to the list; else skip

lst1=as.list(sample(seq(1,100),15))
lst2=as.list(sample(seq(40,99),30))

for(e in lst2)
{
  if (e %in% lst1)
  {
    print(paste("Element",e,"already in lst1.. Skipping"))
  }
  else
  {
    print(paste("Element",e,"not found in lst1.. Adding"))
    lst1=append(lst1,e)
    print(paste("lst1 count = ",length(lst1)))
    print(" ")
  }
}

# 2)
# Create a vector of words (about 10-15). count the number of vowels of each word and display the result in the following format
# word=computer, vowels=3
library(stringr)

words = c('ccompuuter','elephant','indianocean','amoeba','umbrella','prgrm')

for(w in words)
{
  ctr=str_count(w,"a") + str_count(w,"e") + str_count(w,"i") + str_count(w,"o") + str_count(w,"u")
  
  print(paste("word=",w," vowels=",ctr))
}


# 3) 
# Generate a random number between 1-99. Check if it divisible by 12.Repeat process till you get the first number.
# display the number and the number of iterations taken to generate the number.
tries=1; end=1
while(end !=0)
{
  num = floor(runif(1,1,99))
  if(num%%12==0)
  {
    print(paste("yahoo.. number generated is",num," Took me",tries,"iterations"))
    end=0
  } else
    tries = tries + 1
}




