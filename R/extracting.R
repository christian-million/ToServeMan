`[.survey` <- function(x, i, j, drop = FALSE){

  has_i <- !missing(i)
  has_j <- !missing(j)
  has_drop <- !missing(drop)

  if(!(has_i & has_j)){
  return(x)
  }

}




foo <- function(x, i, j, drop = TRUE){

  has_i <- !missing(i)
  has_j <- !missing(j)
  has_drop <- !missing(drop)

  if(!(has_i & has_j)){
  return(x)
  }

}

keep_attr <- survey[, "morf"]
