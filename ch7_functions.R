# ch7: functions()

# centigrade to farenheit conversion

# function definition
ctof = function(c)
{
  f = round((9*c + 160) / 5,1)
  return(f)
}

# function call
ctof(32)

# farenheit to centigrade conversion
ftoc = function(f)
{
  c = ((f-32)*5) / 9
  return(c)
}

ftoc(89.6)


# write a single function that will convert d->f OR f->d, depending upon the input parameter

tempconv = function(n,ans)
{
  if(ans == "c")
    temp = paste(round(((n-32)*5) / 9,1),"degree Centrigrade") else 
  if (ans == "f")
    temp = paste(round((9*n + 160) / 5,1),"degree Farenheit") else
    temp = "-9999. Invalid value for ans"
  
  return(temp)  
}

tempconv(10,"c")
tempconv(37,"f")

# write a function that takes a list an input (P1)
# P2 -> action on the list
# 1-> every element in list to be squared
# 2 -> every element in list to be halved
# 3 -> square root

# return the transformed values

convList = function(inlist,action)
{
  outlist = list()
  
  if (action==1)
  {
    for(e in inlist)
      outlist=append(outlist,e^2)
  } else if (action==2)
  {
    for(e in inlist)
      outlist=append(outlist,round(e/2,2))
  } else if (action==3)
  {
    for(e in inlist)
      outlist=append(outlist,round(sqrt(e),2))
  } else
    outlist = c()
    
  return(outlist)
}

inlist = sample(seq(10,20),4)
unlist(convList(inlist,1))

## mandatory and optional parameters
# increase credit score by n% (default=10) if the credit score is between 1 and 100
giveCredit = function(crscore,crvalue=10)
{
  if (crscore %in% seq(1,100))
      newcr = crscore + (crvalue/100)*crscore
  else
    newcr = crscore
  
  return(newcr)
}

###
giveCredit = function(crscore,crvalue=10)
{
  if (crscore %in% seq(1,100))
    crscore = crscore + (crvalue/100)*crscore

  return(crscore)
}

giveCredit(18,15)


# return multiple values from R function
prices = function(base,tax,disc)
{
  # empty list to return multiple values
  ret = list()
  
  price = base - (disc/100)*base + (tax/100)*base
  
  ret[1] = base
  ret[2] = price
  
  return(ret)
}

p = prices(1475,14,5)
print(paste('Base Price=',p[1],'.After Tax and Discount, price = ',p[2]))

# named parameters
p = prices(tax=14,base=1475,disc=5)
print(paste('Base Price=',p[1],'.After Tax and Discount, price = ',p[2]))




