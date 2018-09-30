# Find Better Way to access variables based on non-name attributes

get_response <- function(x){
  responses <- sapply(x, is.response)
  x[responses]
}

get_categorical <- function(x){
  cats <- sapply(x, is.categorical)
  x[cats]
}

#TO-DO: Create GET Functions for rest of response_type classes
