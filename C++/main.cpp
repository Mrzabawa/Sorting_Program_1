//
//  main.cpp
//  Sort_Cplusplus
//
//  Created by Michael Zabawa on 9/15/18.
//  Copyright © 2018 Michael Zabawa. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <vector>
#include "Sorts.h"
#include "functions.h"
using namespace std;
int main() {
    //vector<int> bubble_set;
    //vector<int> insertion_set;
    vector<int> selection_set;
    
    string path = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_Cplusplus/one-million-randoms.txt";
    //bubble_set = fileToVector(path, bubble_set);
    //insertion_set = fileToVector(path, insertion_set);
    selection_set = fileToVector(path, selection_set);
    //cout << "Bubble sort\n";
    //bubbleSort(bubble_set);
    //cout << "\n\nInsertion sort\n";
    //insertionSort(insertion_set);
    cout << "\n\nSelection sort\n";
    selectionSort(selection_set);
    //cout << endl;
    //if(bubble_set == insertion_set && insertion_set == selection_set){
    //    cout << "All Equal!!! good job";
    //}
    //else{
    //   cout << "Needs some work :(";
    //}
    
    return 0;
}
