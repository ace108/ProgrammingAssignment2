## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function


# function makeCacheMatrix creates a special "matrix" object that can cache its inverse.
# which is really a list containing a function to
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse
# get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)

    
}


## Write a short comment describing this function

# function determines the inverse of the special "matrix" created with the above function. 
# However, it first checks to see if the inverse has already been determined.
# If so, it gets the inverse from the cache and skips the computation. 
# Otherwise, it determines the inverse of the data and sets the inverse cache via the setsolve function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m) && (1==1) ) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
