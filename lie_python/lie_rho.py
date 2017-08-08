import pandas as pd
import numpy as np

def lie(x,y):
    sample_cnt = len(x)
    ct = pd.crosstab(np.array(y),np.array(x))
    nrows,ncols = ct.shape[0],ct.shape[1]
    props = ct/sample_cnt
    col_sums = props.sum(axis=0)
    row_sums = props.sum(axis=1)
    if ct.shape[1]==1:
        return 0
    else:
        i,j = 0,0
        rho = 0.0
        while i<nrows:
            j = 0
            while j <ncols:
                temp = props[j][i]**2/(row_sums[i]*col_sums[j])
                rho = rho + temp
                j = j+1
            i = i+1
        return(rho - 1)

#x = [0,0,0,1,0,0,1,0,0,1,0,1,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1,0]
#y = ['CEU','CEU','CEU','ASW','CEU','CEU','ASW','CEU','CEU','YRI','CEU','YRI','CEU','CEU','CEU','CEU','ASW','CEU','CEU','CEU','ASW','CEU','CEU','CEU','YRI','CEU','CEU','ASW','CEU']
#rho = lie(x,y)
#print(rho)

