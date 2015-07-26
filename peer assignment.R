## These are two that functions work together to store caches of inverses of matrices
## so that there could be no inversions been repeated

## The first function, makeCacheMatrix creates a list with the following functions:
## 1. sets the value of the matrix
## 2. gets the value of the matric
## 3. sets the value of the inverse using solve()
## 4. gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(inv) i <<- inv
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## The following function checks first if the inverse has already been calculated
## If yes, it gets the inverse
## If no, it calculates the inverse using solve()
## and sets it for future use using setinv.

cacheSolve <- function(x, ...) {
    i <- x$getinv()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(m)
    i
}