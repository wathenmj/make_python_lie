# example
#   open and load function Rho_alt.R
#   open loop_lie.R to see how the data is to be read for in for loop

#  Example below is screen shot 
> a <- refGeno[ ,2] # run this line outside loop for example
> b <- refGeno[,i+2]
> Rho_alt(a,b)
[1] 0.01404028
> x <- a
> y <- b
> temp
y
x       0   1
CEU  91   8
CHB  98   5
YRI 106   2
> tbl
y
x               0           1
CEU 0.293548387 0.025806452
CHB 0.316129032 0.016129032
YRI 0.341935484 0.006451613