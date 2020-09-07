
# Charge package for inverse matrix

install.packages("matlib")
library(matlib)


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}



## Apply the functions

Inverse(A)



A <- matrix( c(5, 1, 0,
               3,-1, 2,
               4, 0,-1), nrow=3, byrow=TRUE)
det(A)

B<-makeCacheMatrix(A)
cacheSolve(B)


## To carry out the assignement I base myself on what was published by Thymios (2016):
## https://rpubs.com/RprogameR/241424
