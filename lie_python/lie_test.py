import pandas as pd
import numpy as np
from lie_rho import lie
import timeit

start_time = timeit.default_timer()
fw = open("C:\\Users\\ghai7c\\Desktop\\random_forests\\ceu_yri_chb_A.raw")

lines = fw.readlines()

print("Number of lines read:",len(lines)-1)
first_line = lines[0]
# FID IID PAT MAT  PHENOTYPE rs12565286_C....
splits = first_line.split(" ")
snp_cnt = len(splits[6:])
print("Number of SNPs:",snp_cnt)
#snp_names[5]

pops = pd.read_csv('C:\\Users\\ghai7c\\Desktop\\random_forests\\pop_names', sep=" ")
pops = pops.drop('IID',axis=1)
y = np.array(pops['pop'])

X = []
for line in lines[1:]:
    splits = line.split(" ")
    inputs = [int(x) for x in splits[6:]]
    X.append(inputs)

elapsed_read = timeit.default_timer() - start_time
print("Time to read files(seconds):",elapsed_read)
print("Number of labels:",len(y))

X = np.asarray(X)
rhos = np.apply_along_axis(lie,0,X,y)
'''
rhos = np.zeros(snp_cnt)
i=0
loop_start = timeit.default_timer()
while i<1000:
    rhos[i] = lie(X[i],y)
    i = i+1
'''
elapsed_lie = timeit.default_timer() - loop_start
print("Time to finish LIE loop(seconds):",elapsed_lie)
#6219 seconds