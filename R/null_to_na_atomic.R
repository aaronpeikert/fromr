#' Turn null into na (for a vector)
#'
#' \code{null_to_na_atomic} is for internal use of get_results \code{null_to_na}
#' @export
null_to_na_atomic <- function(x){
  is_null <- sapply(x, is.null)
  x[is_null] <- NA
  return <- unlist(x)
  names(return) <- NULL
  return
}
