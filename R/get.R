# Find Better Way to access variables based on non-name attributes

get_resp_type <- function(x, Q){

  w <- grep(Q, resp_type(x))
  return(w)

}

#test[get_item(x = test, Q = "ordinal")]

