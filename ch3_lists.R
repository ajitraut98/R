# ch3_lists

# heterogenous objects
# named / unnamed list

# create a simple, unnamed list
capitals=list('new delhi','tokyo','beijing','london')
capitals

# total elements
length(capitals)

# access the list
capitals[1]
capitals[1:3]

# named list
clr = list('primary' = c('red','green','blue'))
print(clr)

# access the named list - using the $ sign
clr$primary[1]
clr$primary[3]

# convert a list to vector
unlist(capitals)

# adding elements to a list
# by default, values are always added at the end
capitals = append(capitals,c('abc','xyz'))
capitals

# add a new entry after 'new delhi'
# first find the index pos of 'new delhi'
pos = which(capitals == "new delhi")
# append the new value
capitals=append(capitals,"colombo",after=pos)

# change 'abc' into 'jakarta'
capitals[which(capitals=="abc")] = "jakarta"
capitals

# similarly, change "xyz" to "washington dc"
capitals[which(capitals=="xyz")]='washington dc'
capitals

# delete values from list
capitals[7] = NULL
capitals


# create a named list to store my information
# educ type
# insti name
# gpa / Score
# grad_year
myrec=list(
      "eductype" = c('school','highschool','grad'),
      "institute"=c('lawrence','hindu','aegis'),
      "score" = c(88.1,78.9,84.2),
      "year" = c(2001,2003,2007)) 

myrec

# get all the high school details

print(paste("Educ Type=",myrec$eductype[2],"School=", myrec$institute[2],"Score=",myrec$score[2], "Grad Year=",myrec$year[2]))


# merge lists
# lists can contain different data types
list1 = list(c(1,2,3,4,5))
list2 = list(c('a','b','c'))
list3 = c(list1, list2)
list3

# convert list->vector
unlist(list3)

# pre-defined vectors
letters
as.list(letters)
LETTERS
month.name
month.abb