as.survey <- function(x,          # An object to coerce to class "survey"
                      q.desc,     # Vector or list of question description
                      item.lbl,   # Vector or list of item labels
                      resp.type,  # Vector or list of response types
                      resp.opts = NULL){ # Optional to pass factor levels

  # Assign Attribute Arguments
  q_desc(x)    <- q.desc
  item_lbl(x)  <- item.lbl
  resp_type(x) <- resp.type



  # Check/Add to class of X
  if(!inherits(x, "survey")){
    class(x) <- c("survey", class(x))
  }

  return(x)

}
# test <- surveyr::sample_survey
# test <- as.survey(test, q.desc = qdesc, item.lbl = itemlbl, resp.type = resptype)
# qdesc <- surveyr::sample_schema[["q_description"]]
# itemlbl <- surveyr::sample_schema[["q_detail"]]
# resptype <- surveyr::sample_schema[["q_type"]]


## Attributes ------------------
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

resp_type <- function(x){
  attr(x, "resp.type")
}
"resp_type<-" <- function(x, value){
  attr(x, "resp.type") <- value
  x
}

## Classes -------------------------------

add_class <- function(x, value){
  class(x) <- c(value, class(x))
  x
}
"add_class<-" <- function(x, value){
  class(x) <- c(value, class(x))
  x
}
