null_to_na_atomic <- function(x){
  is_null <- sapply(x, is.null)
  x[is_null] <- NA
  return <- unlist(x)
  names(return) <- NULL
  return
}