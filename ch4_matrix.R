# ch4_matrix

num = sample(seq(25,99),30)
num

# create a matrix
mx1=matrix(num,ncol=5)
mx1
# by default, matrix is filled column-wise

# fill matrix row-wise
mx1=matrix(num,ncol=5,byrow = T)

# row and col headings
rows=seq(1,6)
cols=seq(1,5)

mx1=matrix(num,ncol=5,byrow=T,
       dimnames=list(rows,cols))

# size of the matrix
dim(mx1)

# total elements in matrix
length(mx1)

# create a matrix to store marks (1-100) of 10 students with 5 subjects
# student names: generate random names
# subjects: math,science,hist,arts,lang
# fill the data row-wise

num=sample(seq(1,100),50)
rows=stri_rand_strings(10,6,"[A-Za-z]")
cols=c('math','sci','hist','arts','lang')

mx_stud=matrix(num,byrow=T, ncol=length(cols),
               dimnames=list(rows,cols))
mx_stud

# access the matrix
mx_stud[1,1] # r=1,c=1
mx_stud[1,] # r=1, all columns
mx_stud[,1] # all rows, c=1
mx_stud[1,1:3] # r=1,c=first three
mx_stud[3,c(2,5)] #r=3,c=2nd and 5th

# does byrow matter ?

rows=c()
cols=c('pid','pname','prate','pavail')
rec=c(141940,'tv',184910,'Y',
      166672,'mobile',21907,'Y',
      900021,'printer',4199,'N')
# byrow=False
mx_prod=matrix(rec,ncol=4,dimnames=list(rows,cols))

# byrow=True
matrix(rec,ncol=4,byrow=T,dimnames=list(rows,cols))
mx_prod

# transpose a matrix : interchanging of rows and columns
t(mx1)

# matrix arithmetic

n1=seq(1,12)
n2=seq(71,82)

mx1=matrix(n1,ncol=3); mx1
mx2=matrix(n2,ncol=3);mx2

# addition (element-wise addition)
mx1 + mx2

# subtraction
mx2-mx1
mx1-mx2

# multiplication
mx1*mx2

# division
mx1/mx2

# change the dimensions of matrix dynamically
dim(mx1)
mx1 = matrix(mx1,ncol=2)
dim(mx1)

# statistical operations on matrix
# 1) entire matrix
# find the highest mark
max(mx_stud)

# lowest
min(mx_stud)

# average mark
mean(mx_stud)

# median mark
median(mx_stud)

# std deviation
sd(mx_stud)

# 2) row-wise
# average score of every student
res=apply(mx_stud,1,mean)

# find which student has the highest average
names(which(res == max(apply(mx_stud,1,mean))))

# sum total of scores of each student
apply(mx_stud,1,sum)

# highest score by each student
apply(mx_stud,1,max)

# lowest score by each student
apply(mx_stud,1,min)

# 3) column-wise
# subject-wise total
apply(mx_stud,2,sum)

# subject-wise average
apply(mx_stud,2,mean)

# create new columns and rows to a matrix

# create a matrix to store the average stock price from 2001-2010
# columns are: open_price, low_price, high_price, close_price
# price range 155-700 with 1 decimal prec
rows=seq(2001,2010)
cols=c('open','low','high','close')
prices=round(runif(length(rows)*length(cols),
             155,700),1)
prices

mx_stock=matrix(prices,ncol=length(cols),
                dimnames=list(rows,cols))


mx_stock

# add a new column 'avg_trans'
# range -> 1500-5000
trans=sample(seq(1500,5000),length(rows))
trans

# cbind -> column bind (to add a new column)
mx_stock=cbind(mx_stock,"avg_trans" = trans)
print(mx_stock)


# add new rows to the matrix
rows=seq(2011,2020)
cols=c('open','low','high','close')
prices=round(runif(length(rows)*length(cols),
                   580,1200),1)

new1=matrix(prices,ncol=length(cols),
                dimnames=list(rows,cols))
# cbind -> column bind (to add a new column)
new1=cbind(new1,"avg_trans" = trans)

# add the matrix new1 to mx_stock
# rbind() -> row bind -> add new rows

mx_stock = rbind(mx_stock,new1)

# remove column from a matrix
# new1 = new1[,-5]
mx_stock