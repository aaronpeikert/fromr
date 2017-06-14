#' Turn null into na
#'
#' \code{null_to_na} turn null into na for matrix-like objects
null_to_na <- function(mat){
  df <- as.data.frame(mat, stringsAsFactors = FALSE)
  df <- lapply(df, null_to_na_atomic)
  df_out <- as.data.frame(df, stringsAsFactors = FALSE)
  df_out
}
