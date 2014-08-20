##  The purpose of this code is to create two functions that allow us to create a special objecft that stores a matrix
##  and caches its inverse.  


##  The makeCacheMatrix is a special "matrix" which really is a list containing a function to 
## 1. Set the value of the matrix 
## 2. Get the value of the matrix 
## 3. Set the value of the inverse 
## 4. Get the value of the inverse 

makeCacheMatrix <- function(x = matrix()) {

    ##  Establish a  valriable to hold the matrix
    inverseMatrix <- NULL


    ##  Set the value of the matrix
    set <- function(y) { 
        x <<- y 
         inv <<- NULL 
    } 

    ##  Get the value of the matrix
    get <- function() x

    ##  Set the value of the inverse of the matrix
    setInverse <- function(inverse) inverseMatrix <<- inverse

    ##  Get the value of the inverse of the matrix
    getInverse <- function() inverseMatrix
    
    ##  We can retund the functions using a list
    list(set = set, get = get
         setInverse = setInverse
         getInverse = getInverse)

}


## The cacheSolve function calcualtes the inverse of the cached matrix created in the makeCacheMatrix function.  It 
## checks to see if the inverse has already been calculated.  If so, it gets the inverse from the cache and slips the 
## computation. If the inverse hasn't been calculated previously, the function does so and places that into the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
