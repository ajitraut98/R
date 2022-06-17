# ch5_array

# create a multidimensional matrix

# create marks for 20 students, across 4 semesters, for 4 subjects

# create the dimensions
sem=4
rows=stringi::stri_rand_strings(20,4,"[A-Za-z]")
cols=c('math','lang','sci','arts')

marks=sample(seq(1,100),sem*length(rows)*length(cols),replace=T)

length(marks)

# create the student array
# dim -> [R,C,Lines]
arrstud = array(marks,
                dim=c(length(rows),length(cols),sem),
                dimnames=list(rows,cols) )
print(arrstud)

# get the semester 1 details
sem1 = arrstud[,,1]
sem1
sem2 = arrstud[,,2]
sem2

# use the array to calculate and store the total and average marks of each student for every semester
# print semester-wise total

# add 'total' and 'average' to sem matrix
sem1=cbind(sem1,
           total=apply(sem1,1,sum),
           average=round(apply(sem1,1,mean),2))

print(sem1)

# Find the total and average of sem3 without creating a new matrix
apply(arrstud[,,3],1,sum)
apply(arrstud[,,3],1,mean)

##




















































