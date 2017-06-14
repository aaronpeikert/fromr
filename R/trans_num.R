trans_num <- function(x){
  # for test, remove na
  x_test <- na.omit(x)
  # and remove empty strings
  x_test <- x_test[x_test != ""]
  if (any(suppressWarnings(is.na(as.numeric(x_test))))) {
    return <- x
  } else {
    return <- as.numeric(x)
  }
  return(return)
}