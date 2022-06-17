# ch8: apply functions()

# create a matrix to store the newspaper readership of different papers across different cities

# total cities=20 (rows)
city=paste("C",seq(1,20),sep=""); city

# total papers=5 (cols)
paper=c('TOI','DNA','Express','HT','Hindu')

# create the data
ndata=sample(seq(7,90),length(city)*length(paper),replace=T)
length(ndata)

# create the matrix
mxpaper=matrix(ndata,ncol=length(paper),
               dimnames=list(city,paper))
mxpaper


# 1) apply()

# find the total readership of newspapers for each city
r1 = apply(mxpaper,1,sum)

# total readership for city = 'C4'
r1[4]

# total readership for cities C8,C11,C14
apply(mxpaper[c('C8','C11','C14'),],1,sum  )

# find average readership of papers for all cities
apply(mxpaper,1,mean)

# UDF with apply()
# based on a recent survey, it was found that the readership of all papers in all cities decreased by 5%
# find the current readership

# create a function 'decrease'
decrease=function(x) return(round(x-0.05*x,1))

mxpaper

apply(mxpaper,2,decrease)

# find total readership of individual newspapers
apply(mxpaper,2,sum)

# find the average readership of papers 'HT'and 'TOI'
apply(mxpaper[,c('HT','TOI')],2,mean)

# which paper has the highest average readership ?
r2 = apply(mxpaper,2,mean)
names(which(r2==max(r2)))

####
# 2) lapply()
# input: vector/list, output: list

# create a named list
lst_paper=list('TOI' = mxpaper[,1],
               'DNA' = mxpaper[,2],
               'Express' = mxpaper[,3],
               'HT' = mxpaper[,4],
               'Hindu' = mxpaper[,5] )

lst_paper
lapply(lst_paper,sum)

# average readership of 'Express'
lapply(lst_paper[3],mean)

# user-defined function in lapply()
lapply(lst_paper,decrease)

wordvec=c('file','programme','basket','classroom')
lapply(wordvec,nchar)

###

# 3) sapply() - returns a simple output
sapply(lst_paper,sum)
sapply(wordvec,nchar)

# 4) tapply() - equivalent to GROUP BY in SQL
mxpaper

# create tiers for each city and append to the matrix

length(mxpaper)

tier = rep(c(1,2,3),c(7,5,8))

mxpaper=cbind(mxpaper,tier=tier)
mxpaper

# find total of readership of TOI, for every Tier
# tapply(<col to aggregate>, <col to group by>,<fun>
tapply(mxpaper[,1],mxpaper[,6],sum)

# average readership for 'DNA', group by Tier
tapply(mxpaper[,'DNA'],mxpaper[,'tier'],mean)


# 5) rapply() - combine multiple operations

# sum of readership for TOI
sum(lst_paper$TOI)

# sum of readership for DNA
sum(lst_paper$DNA)

# sum of readership for Express
sum(lst_paper$Express)

# combine all in one function
rapply(lst_paper[1:3],sum)

# output in a list form
rapply(lst_paper[1:3],sum,how="list")


# 6) vapply()
mylist = list(seq(1,10), seq(71,80))
mylist

summary(unlist(mylist[1]))
summary(unlist(mylist[2]))

vapply(mylist,summary,
       FUN.VALUE = c(numeric(1), numeric(1),
                     numeric(1), numeric(1),
                     numeric(1), numeric(1)) )

# 7) mapply()
v1=c(1:5); v1
v2=c(1:5); v2
v3=c(1:5); v3

# column-wise addition of all elements
mapply(sum,v1,v2,v3)


# end of apply() functions .........


dataframes
stats
eda+visualisation
ml





