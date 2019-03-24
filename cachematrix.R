## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function creates a special matrix object whose inverse can be cached
##makeCacheMatrix creates a special “matrix”, which is really a list containing a function to:

##1. set the value of the matrix
##2. get the value of the matrix
##3. set the value of the inverse
##4. get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
} 


## Write a short comment describing this function
##This function computes the inverse of the special matrix created by the above function
##If an inverse has alreayd ben calculated, then cacheSolve retrieves the inverse from 
##the cache and displays the message of "getting from cache" while doing so!

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cahced data")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinverse(i)
  i
}

##----------------------testing----------!!!!!!!!!!!
#B <- matrix(c(2,6,7,8),2,2)
#B1 <- makeCacheMatrix(B)
#cacheSolve(B1)
