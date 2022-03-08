## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Install a package that contains a matrix inverse function in its library.
## install.packages("matlib")
## library(matlib)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  ## set the matrix.
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  ## get the matrix.
  get <- function() x
  
  ## set the inverse matrix of original matrix.
  setInv <- function(inv) m <<- inv
  
  ## get the inverse matrix of original matrix
  getInv <- function() m
  
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inv(data, ...)
  x$setInv(m)
  m
}