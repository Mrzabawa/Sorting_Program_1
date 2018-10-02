#Michael Zabawa
#Program for Algorthims 3412
#Problem 1
#Professor Dr Willams
#Sorting

###############################################################################
def insertionSort_py(setA):
    count = 0
    for j in range(1, len(setA)):
        key = setA[j]
        i = j
        while i > 0 and setA[i - 1] > key:
            setA[i] = setA[i - 1]
            i = i - 1
            count = count + 1
        setA[i] = key
    return count;
###############################################################################
def bubbleSort_py(setA):
    count = 0
    for i in range(len(setA) - 1):
        for j in range(len(setA) - 1, i ,-1):
            if setA[j] < setA[j - 1]:
                setA[j], setA[j - 1] = setA[j-1], setA[j]
                count = count + 1
    return count;
###############################################################################
def selectionSort_py(setA):
    values = []
    loopcount = 0
    swapcount = 0
    index = 0
    for i in range(len(setA)):
        mIn = float('inf')
        for j in range(i, len(setA)):
          loopcount = loopcount + 1
          if(setA[j] < mIn):
              mIn = setA[j]
              index = j
              swapcount = swapcount + 1
        setA[i],setA[index] = setA[index], setA[i]
    values.append(setA)
    values.append(loopcount)
    values.append(swapcount)
#    print("swapcount = ", swapcount)
    return values;
###############################################################################
def selectionSortIM_py(setA):
    loopcount = 0
    index = 0
    for i in range(len(setA)):
        index = setA.index(min(setA[i: len(setA)]))
        setA[i],setA[index] = setA[index], setA[i]
        loopcount = loopcount + 1
    print("loopcount = ", loopcount)
    return setA;

###############################################################################   
def merge(setA, p, q, r):
    count = 0
    L = setA[p : q + 1]
    R = setA[q + 1 : r + 1]
    L.append(float('inf'))#keeps in range for merging
    R.append(float('inf'))#keeps in range for merging
    i = 0
    j = 0
    for k in range(p, r + 1):
        if L[i] <= R[j]:
            setA[k] = L[i]
            i = i+1
            count = count+1
        else:
            setA[k] = R[j]
            j = j+1
            count = count+1
    return count;
    
def _mergeSort(setA, p, r):
    count = 0
    if p < r:
        q = (p+r)//2
        _mergeSort(setA, p, q)
        _mergeSort(setA, q + 1, r)
        count = merge(setA, p, q, r)
    return count;

def mergeSort_py(setA):
   count = _mergeSort(setA, 0, len(setA) - 1)
   return count;
###############################################################################    
def bucketSort_py(setA):
    index = 0
    bucket = [0] * 1000 #known that the valaues run from 0 - 999
    for num in setA:
        bucket[num] = bucket[num] + 1 #goes through all the values in setA and adds a 1 to the bucket total
    for i in range(len(bucket)): #looks at each total in the i bucket
        if bucket[i] > 0:
            for num1 in range(bucket[i]):
                setA[index + num1] = i
            index = index + bucket[i]
    return setA;
    
    
