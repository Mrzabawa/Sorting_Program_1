library(readr)
library(Rcpp)
library(ggplot2)
library(reticulate)

source_python("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_python/sorts.py")

#selection sort
selectionSort_R <- function(setA){
  loopcount = is.integer(0)
  swapcount = is.integer(0)
  for(i in seq_along(setA)){
    min <- Inf
    index = 0
    for(j in seq(from = i, to = length(setA))){
      loopcount <- loopcount + 1
      if(setA[j] < min){#find min
        min <- setA[j]
        index = j
        swapcount <- swapcount + 1
      }
    }
    #swap
    temp = setA[i]
    setA[i] = setA[index]
    setA[index] = temp
  }
  return(list(setA, loopcount, swapcount))
}

# improved selection sort
selectionSortIM_R <- function(setA){
  loopcount = 0
  for(i in seq_along(setA)){# 1 to n
    index <- which.min(setA[i:length(setA)]) + i - 1 #find minimum index
    #swap items
    temp <- setA[i]
    setA[i] <- setA[index]
    setA[index] <- temp
    loopcount = loopcount + 1
  }
  return(list(setA, loopcount))
}

#c++ implementation
cppFunction(
'List selectionSortCpp(IntegerVector setA){
  int min = 0;
  int temp = 0;
  int index = 0;
  long int loopCount = 0;
  long int swapCount = 0;
  List values;
  for(int i = 0; i < int(setA.size()); i++){
    min = std::numeric_limits<int>::max();// is an upper bound for eveything
    for(int j = i; j < int(setA.size()); j++){//find minimum
      loopCount = loopCount + 1;      
      if(setA[j] < min){
        min = setA[j];
        index = j;
        swapCount = swapCount + 1;
      }//if
    }//for
    //swap min to setA[i]
    if(i != index){
    temp = setA[i];
    setA[i] = setA[index];
    setA[index] = temp;
    }//swap if index is not equal to i
  }//for
  values["setA"] = setA;
  values["loopCount"] = loopCount;
  values["swapCount"] = swapCount;
  return values;
}//function
')

loopData <- data.frame(matrix(nrow = 12,ncol = 4))
timeData <- data.frame(matrix(nrow = 12,ncol = 4))
swapData <- data.frame(matrix(nrow = 12,ncol = 4))
loopData[1,1] <- timeData[1,1] <- swapData[1,1]<- 10
loopData[2,1] <- timeData[2,1] <- swapData[2,1]<- 100
loopData[3,1] <- timeData[3,1] <- swapData[3,1]<- 1000
loopData[4,1] <- timeData[4,1] <- swapData[4,1]<- 5000
loopData[5,1] <- timeData[5,1] <- swapData[5,1]<- 10000
loopData[6,1] <- timeData[6,1] <- swapData[6,1]<- 30000
loopData[7,1] <- timeData[7,1] <- swapData[7,1]<- 50000
loopData[8,1] <- timeData[8,1] <- swapData[8,1]<- 70000
loopData[9,1] <- timeData[9,1] <- swapData[9,1]<- 100000
loopData[10,1] <- timeData[10,1] <- swapData[10,1]<- 500000
loopData[11,1] <- timeData[11,1] <- swapData[11,1]<- 750000
loopData[12,1] <- timeData[12,1] <- swapData[12,1]<- 1000000
names(timeData) <- c("N", "Python", "R", "C++")
names(loopData) <- c("N", "Python", "R", "C++")
names(swapData) <- c("N", "Python", "R", "C++")
#set up variables for test
A <- c()
vec1 = vector(mode = "numeric", 10L)
vec2 = vector(mode = "numeric", 10L)
vec3 = vector(mode = "numeric", 10L)
vec1loop = data.frame(matrix(nrow = 12,ncol = 10))
vec2loop = data.frame(matrix(nrow = 12,ncol = 10))
vec3loop = data.frame(matrix(nrow = 12,ncol = 10))
vec1swap = data.frame(matrix(nrow = 12,ncol = 10))
vec2swap = data.frame(matrix(nrow = 12,ncol = 10))
vec3swap = data.frame(matrix(nrow = 12,ncol = 10))
#testing procedure
for(j in seq(2)+9){
  for(i in seq(1)){#run each sort 10 times
    A1 <- sample.int(1000, size = timeData[j,1], replace = TRUE)
    
    #vec1[i] <- system.time(B1 <- selectionSort_py(A1))[3]
    #vec2[i]<- system.time(B2 <- selectionSort_R(A1))[3]
    vec3[i] <- system.time(B3 <- selectionSortCpp(A1))[3]
    
    #vec1loop[j,i] = B1[[2]]
    #vec2loop[j,i] = B2[[2]]
    vec3loop[j,i] = B3[[2]]
    
    #vec1swap[j,i] = B1[[3]]
    #vec2swap[j,i] = B2[[3]]
    vec3swap[j,i] = B3[[3]]
    print(i)
  }
  #timeData[j,2] = mean(vec1)
  #timeData[j,3] = mean(vec2)
  timeData[j,4] = mean(vec3)
  
  #loopData[j,2] = mean(vec1loop[,j])
  #loopData[j,3] = mean(vec2loop[,j])
  loopData[j,4] = mean(vec3loop[,j])
  
  #swapData[j,2] = mean(vec1swap[,j])
  #swapData[j,3] = mean(vec2swap[,j])
  swapData[j,4] = mean(vec3swap[,j])
}

#save data took a long time to run
save(timeData, file = "timeData.rda")
save(loopData, file = "loopData.rda")
save(swapData, file = "swapData.rda")

#plot data
ggplot(data = timeData, aes(x = `N`))+
  geom_line(aes(y = `R`, color = "R"))+
  geom_line(aes(y = `Python`, color = "Python"))+
  geom_line(aes(y = `C++`, color = "C++"))+
  labs(y = "Time in Seconds", title = "Selection Sort", colour = "Implementation")

ggplot(data = loopData, aes(x = `N`))+
  geom_line(aes(y = `R`, color = "R"))+
  geom_line(aes(y = `Python`, color = "Python"))+
  geom_line(aes(y = `C++`, color = "C++"))+
  labs(y = "Number of Loops", title = "Selection Sort", colour = "Implementation")

ggplot(data = swapData, aes(x = `N`))+
  geom_line(aes(y = `R`, color = "R"))+
  geom_line(aes(y = `Python`, color = "Python"))+
  geom_line(aes(y = `C++`, color = "C++"))+
  labs(y = "Time in Seconds", title = "Selection Sort", colour = "Implementation")

#work on some predictions
Nsquared <- timeData$N ^2
lmod <- lm(`C++`~ `N`, data = swapData)
summary(lmod)
newdata <- data.frame(1000000)
names(newdata) = c( "N")
predict.lm(lmod, newdata)

#test prediction
path <-"one-million-randoms.txt"
data <- read.delim(file = path, sep = "\n")
head(data)
data <- data[-1,]
item1 <- system.time(B <- selectionSortCpp(data))


timeData2 <- timeData
timeData[11,] <- timeData2[12,]
timeData3 <- timeData
