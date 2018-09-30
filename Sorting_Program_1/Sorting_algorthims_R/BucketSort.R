library(reticulate)

setwd("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_python/")
source_python("sorts.py")
bucketSortR <- function(setA = A){
  index = 0
  B <- rep(0, 1000)
  for(i in seq_along(setA)){#fills buckets
    B[setA[i]] = B[setA[i]] + 1
  }
  for(i in seq_along(B)){
    if(B[i] > 0){
      for(num in seq(B[i])){
        setA[index + num] = i
        index = index + B[i]
      }
    }
  }
  return(setA)
}

A <- sample.int(1000, size =1000000, replace = TRUE)
A <- bucketSortR(A)
path <-"one-million-randoms.txt"
data <- read.delim(file = path, sep = "\n")
head(data)
data <- data[-1,]
item1 <- system.time(B <- bucketSortR(A))
item1
head(B)
tail(B)
