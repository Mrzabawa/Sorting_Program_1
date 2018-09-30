//
//  sort_functions.cpp
//  Sort_Cplusplus
//
//  Created by Michael Zabawa on 9/16/18.
//  Copyright © 2018 Michael Zabawa. All rights reserved.
//
#include <vector>
#include <fstream>
#include "functions.h"

using namespace std;
vector<int> fileToVector(string path, vector<int> & vec){
    int temp = 0;
    string tempstring = "";
    ifstream infile(path);
    getline(infile, tempstring);//burns header
    infile >> temp;//burns first number
    while(infile >> temp){
        vec.push_back(temp); 
}
infile.close();
    return vec;
}
