##  The purpose of this code is to create two functions that allow us to create a special objecft that stores a matrix
##  and caches its inverse.  


##  The makeCacheMatrix is a special "matrix" which really is a list containing a function to 
## 1. Set the value of the matrix 
## 2. Get the value of the matrix 
## 3. Set the value of the inverse 
## 4. Get the value of the inverse 

makeCacheMatrix <- function(x = matrix()) {

        ##  Establish a  valriable to hold the matrix
        ##  We NULL out the matrix to ensure that that we have a completely clear space to work with. 
        ##  The calculation is agnostic to whether the matrix is hard data coming into it, or a
        ##  cached matrix.
  
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
    
        ##  We can return the functions using a list
        list(set = set, get = get
                setInverse = setInverse
                getInverse = getInverse)

}


## The cacheSolve function calcualtes the inverse of the cached matrix created in the makeCacheMatrix function.  It 
## checks to see if the inverse has already been calculated.  If so, it gets the inverse from the cache and slips the 
## computation. If the inverse hasn't been calculated previously, the function does so and places that into the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverseMatrix <- x$getInverse()
        
        ## Check to see if we have already calculated and cached the inverse of the matrix
        ##  If we have, we'll return the inverse of the matrix.  
        
        if(!is.null(inverseMatrix)) {
                message("getting cached data")
                return(inverseMatrix)
        }
        
        ##  At this point, we know the inverse has not been previously calculeted, so we complete the calculation.
        data <- x$get()
        inverseMatrix <- solve(data, ...)
        
        ##  We take the inverse that we calculated and place it into cache
        ##  We are holding the cached matrix in a list as a component of x.
        x$setInverse(inverseMatrix)
        
        ##  Return the inverse of the matrix
        inverseMatrix
}
