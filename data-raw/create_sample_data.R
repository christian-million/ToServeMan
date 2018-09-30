# Create Sample Data

sample_survey_data <- data.frame(id = 1:50,
                            morf = sample(c("M","F"), size =50, replace = TRUE),
                            age    = sample(c(18:65), size = 50, replace = TRUE),
                            agree1 = sample(agree_scale(), size = 50, replace = TRUE),
                            agree2 = sample(c(agree_scale(),NA), size = 50, replace = TRUE),
                            agree3 = sample(agree_scale(), size = 50, replace = TRUE),
                            often1 = sample(often_scale(), size = 50, replace = TRUE),
                            often2 = sample(often_scale(), size = 50, replace = TRUE),
                            open1  = stringi::stri_rand_lipsum(50),
                            open2  = stringi::stri_rand_lipsum(50),
                            other = sample(c(agree_scale(), LETTERS[1:2]),size = 50, replace = TRUE),
                            multi = replicate(50, paste(sample(c("US","UK","CAN","MEX"), size = sample(0:3, size = 1), replace = FALSE), collapse = ";")),
                            factor = sample(paste0("opt", 1:5), size = 50, replace = TRUE),
                            stringsAsFactors = FALSE)

sample_schema <- data.frame(qdesc = c("Identification #",
                                         "Do you prefer the letter 'M' or 'F'?",
                                         "What is your Age?",
                                         "To what extent do you agree with the following statements?",
                                         "To what extent do you agree with the following statements?",
                                         "To what extent do you agree with the following statements?",
                                         "How often do you do each of the following?",
                                         "How often do you do each of the following?",
                                         "Tell me how you feel?",
                                         "What do you think?",
                                         "Select an option or write in something else",
                                         "Choose all that apply.",
                                         "Choose One"),
                            itemlbl = c("Identification #",
                                        "Do you prefer the letter 'M' or 'F'?",
                                        "What is your Age?",
                                        "Cheese is good.",
                                        "Bananas are bad.",
                                        "Apples are dumb.",
                                        "Eat pizza over the sink like a rat.",
                                        "Cry.",
                                        "Tell me how you feel?",
                                        "What do you think?",
                                        "Select an option or write in something else",
                                        "Choose all that apply.",
                                        "Choose One"),
                            resptype = c("meta",
                                         "binary",
                                         "interval",
                                         "ordinal",
                                         "ordinal",
                                         "ordinal",
                                         "ordinal",
                                         "ordinal",
                                         "open",
                                         "open",
                                         "cat_o",
                                         "multi_cat",
                                         "cat"), stringsAsFactors = FALSE)

convert_to_survey <- function(data, schema){

  schema <- schema

  out <- as.survey(data,
                   q.desc = schema$qdesc,
                   item.lbl = schema$itemlbl,
                   resp.type = schema$resptype)
  return(out)
}

sample_survey_obj <- convert_to_survey(sample_survey_data, sample_schema)

devtools::use_data(sample_survey_data, overwrite = TRUE)
devtools::use_data(sample_survey_obj, overwrite = TRUE)
devtools::use_data(sample_schema, overwrite = TRUE)


