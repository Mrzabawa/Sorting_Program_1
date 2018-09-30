#Michael Zabawa
#Program for Algorthims 3412
#Problem 1
#Professor Dr Willams
#Sorting
import time
import sorts
import random

#import the data sets and clean them
def filetoList(path):
    filestream = open(path, "r")
    finalList1 = []
    filestream.readline()
    filestream.readline()
    for value in filestream.read().split():
        finalList1.append(int(value))
    filestream.close()
    return finalList1;

################################################################################
def funTest(f, x):
    start = time.clock()
    f(x)
    print("loop count = ", "  elapsed time = ", (time.clock() - start))
    return;
################################################################################
#print('Selection Sort')
#testlist = random.sample(range(100000), 100000)
#shuffled_selectionset = filetoList("shuffled.txt")
#sorted_selectionset = filetoList("sorted.txt")
#nearly_sorted_selectionset = filetoList("nearly-sorted.txt")
#unsorted_selectionset = filetoList("unsorted.txt")
#nearly_unsorted_selectionset = filetoList("nearly-unsorted.txt")
#duplicate_selectionset = filetoList("duplicate.txt")
#one_million_randoms_selectionset = filetoList("one-million-randoms.txt")

#print("Test sample")
#funTest(sorts.selectionSort,testlist)
#print("shuffled")
#funTest(sorts.selectionSort, shuffled_selectionset)
#print("sorted")
#funTest(sorts.selectionSort, sorted_selectionset)
#print("nearly-sorted")
#funTest(sorts.selectionSort, nearly_sorted_selectionset)
#print("unsorted")
#funTest(sorts.selectionSort, unsorted_selectionset)
#print("nearly-unsorted")
#funTest(sorts.selectionSort, nearly_unsorted_selectionset)
#print("duplicate")
#funTest(sorts.selectionSort,duplicate_selectionset)
#print("one-million-randoms")
#funTest(sorts.selectionSort,one_million_randoms_selectionset)
################################################################################
#print('Selection Sort Improved')
#testlist = random.sample(range(200), 100)
#shuffled_selectionsetIM = filetoList("shuffled.txt")
#sorted_selectionsetIM = filetoList("sorted.txt")
#nearly_sorted_selectionsetIM = filetoList("nearly-sorted.txt")
#unsorted_selectionsetIM = filetoList("unsorted.txt")
#nearly_unsorted_selectionsetIM = filetoList("nearly-unsorted.txt")
#duplicate_selectionsetIM = filetoList("duplicate.txt")
#one_million_randoms_selectionset = filetoList("one-million-randoms.txt")

#print("Test sample")
#funTest(sorts.selectionSortIM, testlist)
#print("shuffled")
#funTest(sorts.selectionSortIM, shuffled_selectionsetIM)
#print("sorted")
#funTest(sorts.selectionSortIM, sorted_selectionsetIM)
#print("nearly-sorted")
#funTest(sorts.selectionSortIM, nearly_sorted_selectionsetIM)
#print("unsorted")
#funTest(sorts.selectionSortIM, unsorted_selectionsetIM)
#print("nearly-unsorted")
#funTest(sorts.selectionSortIM, nearly_unsorted_selectionsetIM)
#print("duplicate")
#funTest(sorts.selectionSortIM, duplicate_selectionsetIM)
#print("one-million-randoms")
#funTest(sorts.selectionSortIM,one_million_randoms_selectionsetIM)
################################################################################
#print('Insertion Sort')
#testlist = random.sample(range(100000), 100000)
#shuffled_insertionset = filetoList("shuffled.txt")
#sorted_insertionset = filetoList("sorted.txt")
#nearly_sorted_insertionset = filetoList("nearly-sorted.txt")
#unsorted_insertionset = filetoList("unsorted.txt")
#nearly_unsorted_insertionset = filetoList("nearly-unsorted.txt")
#duplicate_insertionset = filetoList("duplicate.txt")
#one_million_randoms_insertionset = filetoList("one-million-randoms.txt")

#print("Test sample")
#funTest(sorts.insertionSort,testlist)
#print("shuffled")
#funTest(sorts.insertionSort, shuffled_insertionset)
#print("sorted")
#funTest(sorts.insertionSort, sorted_insertionset)
#print("nearly-sorted")
#funTest(sorts.insertionSort, nearly_sorted_insertionset)
#print("unsorted")
#funTest(sorts.insertionSort, unsorted_insertionset)
#print("nearly-unsorted")
#funTest(sorts.insertionSort, nearly_unsorted_insertionset)
#print("duplicate")
#funTest(sorts.insertionSort,duplicate_insertionset)
#print("one-million-randoms")
#funTest(sorts.insertionSort,one_million_randoms_insertionset)
################################################################################
#print("Bubble Sort")
#testlist = random.sample(range(100000), 100000)
#shuffled_bubbleset = filetoList("shuffled.txt")
#sorted_bubbleset = filetoList("sorted.txt")
#nearly_sorted_bubbleset = filetoList("nearly-sorted.txt")
#unsorted_bubbleset = filetoList("unsorted.txt")
#nearly_unsorted_bubbleset = filetoList("nearly-unsorted.txt")
#duplicate_bubbleset = filetoList("duplicate.txt")
#one_million_randoms_bubbleset = filetoList("one-million-randoms.txt")

#print("Test sample")
#funTest(sorts.bubbleSort,testlist)
#print("shuffled")
#funTest(sorts.bubbleSort,shuffled_bubbleset)
#print("sorted")
#funTest(sorts.bubbleSort,sorted_bubbleset)
#print("nearly-sorted")
#funTest(sorts.bubbleSort,nearly_sorted_bubbleset)
#print("unsorted")
#funTest(sorts.bubbleSort,unsorted_bubbleset)
#print("nearly-unsorted")
#funTest(sorts.bubbleSort,nearly_unsorted_bubbleset)
#print("duplicate")
#funTest(sorts.bubbleSort,duplicate_bubbleset)
#print("one-million-randoms")
#funTest(sorts.bubbleSort,one_million_randoms_bubbleset)
################################################################################
#
print('Merge Sort')
#shuffled_set = filetoList("shuffled.txt")
#sorted_set = filetoList("sorted.txt")
#nearly_sorted_set = filetoList("nearly-sorted.txt")
#unsorted_set = filetoList("unsorted.txt")
#nearly_unsorted_set = filetoList("nearly-unsorted.txt")
#duplicate_set = filetoList("duplicate.txt")
one_million_randoms_mergeset = filetoList("one-million-randoms.txt")
#
#print("shuffled")
#funTest(sorts.mergeSort, shuffled_set)
#print("sorted")
#funTest(sorts.mergeSort, sorted_set)
#print("nearly-sorted")
#funTest(sorts.mergeSort, nearly_sorted_set)
#print("unsorted")
#funTest(sorts.mergeSort, unsorted_set)
#print("nearly-unsorted")
#funTest(sorts.mergeSort, nearly_unsorted_set)
#print("duplicate")
#funTest(sorts.mergeSort, duplicate_set)
print("one-million-randoms")
funTest(sorts.mergeSort, one_million_randoms_mergeset)

################################################################################
#
print('Bucket Sort')
#shuffled_set = filetoList("shuffled.txt")
#sorted_set = filetoList("sorted.txt")
#nearly_sorted_set = filetoList("nearly-sorted.txt")
#unsorted_set = filetoList("unsorted.txt")
#nearly_unsorted_set = filetoList("nearly-unsorted.txt")
#duplicate_set = filetoList("duplicate.txt")
one_million_randoms_bucketset = filetoList("one-million-randoms.txt")

#print("shuffled")
#funTest(sorts.bucketSort,shuffled_set)
#print("sorted")
#funTest(sorts.bucketSort,sorted_set)
#print("nearly-sorted")
#funTest(sorts.bucketSort,nearly_sorted_set)
#print("unsorted")
#funTest(sorts.bucketSort,unsorted_set)
#print("nearly-unsorted")
#funTest(sorts.bucketSort,nearly_unsorted_set)
#print("duplicate")
#funTest(sorts.bucketSort,duplicate_set)
print("one-million-randoms")
funTest(sorts.bucketSort,one_million_randoms_bucketset)
#
################################################################################
