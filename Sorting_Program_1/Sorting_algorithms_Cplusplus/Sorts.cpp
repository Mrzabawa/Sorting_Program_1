//
//  Sorts.c
//  Sort_Cplusplus
//
//  Created by Michael Zabawa on 9/15/18.
//  Copyright © 2018 Michael Zabawa. All rights reserved.
//

#include <stdio.h>
#include <ctime>
#include <vector>
#include <iostream>
#include <limits>
#include"Sorts.h"


void bubbleSort(std::vector<int> & setA){
    clock_t start;
    start = clock();
    int loopcount = 0;
    int swapcount = 0;
    int temp = 0;
    for(int i = 0; i < setA.size(); i++){
        for(int j = int(setA.size()) - 1; j > i; j = j - 1){
            loopcount = loopcount + 1;
            if (setA[j] < setA[j-1]){
                temp = setA[j];
                setA[j] = setA[j - 1];
                setA[j - 1] = temp;
                swapcount = swapcount + 1;
            }
        }
    }
        std::cout << "Loop count " << loopcount << "\nSwaps " << swapcount << "\nTime = "<< (double)(clock() - start)/1000 << "ms";
}

void insertionSort(std::vector<int> & setA){
    clock_t start;
    start = clock();
    int loopcount = 0;
    int swapcount = 0;
    int key = 0;
    int i = 0;
    for(int j = 0; j < setA.size(); j++){
        key = setA[j];
        i = j;
        loopcount = loopcount + 1;
        while(i > 0 and setA[i - 1] > key){
            setA[i] = setA[i - 1];
            i = i - 1;
            
            setA[i] = key;
            swapcount = swapcount + 1;
        }
    }
        std::cout << "Loop count " << loopcount << "\nSwaps " << swapcount << "\nTime = "<< (double)(clock() - start)/1000 << "ms";
}

void selectionSort(std::vector<int> & setA){
    clock_t start;
    start = clock();
    int min = 0;
    int temp = 0;
    int index = 0;
    int loopcount = 0;
    int swapcount = 0;
    for(int i = 0; i < int(setA.size()); i++){
        min = std::numeric_limits<int>::max();// is an upper bound for eveything
        for(int j = i; j < int(setA.size()); j++){//find minimum
            if(setA[j] < min){
                min = setA[j];
                index = j;
            }//if
            loopcount = loopcount + 1;
        }//for
        //swap min to setA[i]
        if(i != index){
            temp = setA[i];
            setA[i] = setA[index];
            setA[index] = temp;
            swapcount = swapcount + 1;
        }//swap if index is not equal to i
    }//for
    std::cout << "Loop count " << loopcount << "\nSwaps " << swapcount << "\nTime = "<< (double)(clock() - start)/1000 << "ms";
}//function
