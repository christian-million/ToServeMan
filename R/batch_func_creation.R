create_class_func <- function(class_type){


  function(x, i, j, drop = FALSE){

    sub_x <- NextMethod("[<-", drop = drop)
    add_class(sub_x) <- class_type

  return(sub_x)

  }
}

test <- c(paste0("[.",c("binary","multi")))

funs <- Map(create_class_func, c("binary", "multi"))

Map(assign, x = test, value = funs, MoreArgs = list(envir=as.environment("package:ToSurveyMan")))
