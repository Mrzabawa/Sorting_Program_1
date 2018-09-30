

my_merge <- function(setA, p, q, r){
  L <- setA[p:q]
  R <- setA[q+1:r]
  L[q+1] <-  Inf
  R[r+1] <-  Inf 
  i = 1
  j = 1
  for(k in seq(from = p, to = r)){
    if(L[i] <= R[j]){
      setA[k] = L[i]
      i = i + 1
    }
    else{
      setA[k] = R[j]
      j = j + 1
    }
  }
}
merge_Sort <- function(setA = A, p = 0, r = length(A)){
  if(p < r){
    q = (p + r) / 2
  }
  merge_Sort(A, p, q) 
  merge_Sort(A, q + 1, r)
  my_merge(A, p, q, r)
}

mergeSort <- function(setA){
  r = length(setA)
  merge_Sort(setA, 0, r)
}
A <- sample.int(100, size = 10)

mergeSort(A)







