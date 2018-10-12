`[.survey` <- function(x, i, j, drop = FALSE){

  #Plan: Take object attritubes and save them
  #      Extract the data using normal method
  #      Reassign object attributes to changed object

  # Check which arguments are missing
  has_i <- !missing(i)
  has_j <- !missing(j)
  has_drop <- !missing(drop)

  # If no arguments, just return x
  if(!has_i & !has_j){
    return(x)
  }

  ## Extract specified attributes here
    # If i or j are numbers, just use numbers.
    # if i and j are characters, find the integer equivalant
  if(has_j){
    if(is.character(j)){
      j_ind <- which(names(x) %in% j)
    } else {
      j_ind <- j
    }
  }

  if(has_i){
    if(is.character(i)){
      i_ind <- which(row.names(x) %in% i)
    } else {
      i_ind <- i
    }
  }

  ## Create new subsetted object
  sub_x <- as.data.frame(NextMethod("[<-", drop = drop))
  ordered_col <- Reduce(intersect, list(names(x), names(sub_x)))
  sub_x <- sub_x[ordered_col]


  ## Reassign attributes before returning
  if(has_j){
    if(is.data.frame(sub_x)){

      q_desc(sub_x) <- q_desc(x)[j_ind]

      item_lbl(sub_x) <- item_lbl(x)[j_ind]

      sub_x <- as.survey(sub_x, q.desc = q_desc(sub_x), item.lbl = item_lbl(sub_x))

    }
  }

  if(has_i & has_j){
    if(is.data.frame(sub_x)){

      q_desc(sub_x) <- q_desc(x)[j_ind]

      item_lbl(sub_x) <- item_lbl(x)[j_ind]

      sub_x <- as.survey(sub_x, q.desc = q_desc(sub_x), item.lbl = item_lbl(sub_x))

    }
  }

  if(has_i){
    if(is.data.frame(sub_x)){

      q_desc(sub_x) <- q_desc(x)

      item_lbl(sub_x) <- item_lbl(x)

      sub_x <- as.survey(sub_x, q.desc = q_desc(sub_x), item.lbl = item_lbl(sub_x))

    }
  }

  return(sub_x)

}

`[.binary` <- function(x, i, j, drop = FALSE){

  sub_x <- NextMethod("[<-", drop = drop)
  add_class(sub_x) <- "binary"

  return(sub_x)
}
