as.survey <- function(x,          # An object to coerce to class "survey"
                      q.desc    = NULL,     # Vector or list of question description
                      item.lbl  = NULL,   # Vector or list of item labels
                      resp.type = NULL,  # Vector or list of response types
                      resp.opts = NULL){ # Optional to pass factor levels

  # Assign Attribute Arguments
  if(!is.null(resp.type)){
  x <- as.data.frame(Map("resp_type<-", x, resp.type), stringsAsFactors = FALSE)
  }
  q_desc(x)    <- q.desc
  item_lbl(x)  <- item.lbl




  # Check/Add to class of X
  if(!inherits(x, "survey")){
    class(x) <- c("survey", class(x))
  }

  return(x)

}


## Assign Attributes ------------------
item_lbl <- function(x){
  attr(x, "item.lbl")
}
"item_lbl<-" <- function(x, value){
  attr(x, "item.lbl") <- value
  x
}

q_desc <- function(x){
  attr(x, "q.desc")
}
"q_desc<-" <- function(x, value){
  attr(x, "q.desc") <- value
  x
}

## Assign Classes -------------------------------

add_class <- function(x, value){
  class(x) <- c(value, class(x))
  x
}
"add_class<-" <- function(x, value){
  class(x) <- c(value, class(x))
  x
}

resp_type <- function(x){
  types <- sapply(x, class)
  return(types)
}
"resp_type<-" <- function(x, value){
  add_class(x) <- value
  x
}


## Check Classes ------------------------------
resp.types <- c("cat",          # Single Response from fixed options w/ No Order or "Other" Option
                "cat_o",        # Single Response from fixed options w/ No Order but "Other" Option
                "multi_cat",    # Multiple Responses from fixed options w/ No Order or "Other" Option
                "multi_cat_o",  # Multiple Responses from fixed options w/ No Order but "Other" Option
                "binary",       # Single Response from 2 options w/ no Order or "Other" Option (Cat w/ 2 Opts)
                "ordinal",      # Single Response from fixed options w/ natural order and no "Other" Option
                "interval",     # Single Response from continuous options w/ natural order
                "open")         # Open ended text response


is.response <- function(x){
  inherits(x, resp.types)
}
is.cat <- function(x){
  inherits(x, "cat")
}
is.cat_o <- function(x){
  inherits(x, "cat_o")
}
is.multi_cat <- function(x){
  inherits(x, "multi_cat")
}
is.multi_cat_o <- function(x){
  inherits(x, "multi_cat_o")
}
is.binary<- function(x){
  inherits(x, "binary")
}
is.ordinal<- function(x){
  inherits(x, "ordinal")
}
is.interval <- function(x){
  inherits(x, "interval")
}
is.open <- function(x){
 inherits(x, "open")
}
is.categorical <- function(x){
  resp.categorical <- c("cat", "cat_o","multi_cat", "multi_cat_o", "binary")
  inherits(x, resp.categorical)
}
is.multi <- function(x){
  resp.multi <- c("multi_cat", "multi_cat_o")
  inherits(x, resp.multi)
}
is.other <- function(x){
  resp.other <- c("cat_o", "multi_cat_o")
  inherits(x, resp.other)
}
