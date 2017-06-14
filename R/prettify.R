#' Make a List of Surveys from formr pretty
#'
#' \code{prettify} returns the data of one or more surveys from one formr run
#'
#' @param list_of_surveys List of surveys from formr
#' @param conv_null turn null to na (formr gives you by default Null instead of NA)
#' @param conv_num convert should be numerics to numerics
#' @param join should a full join be done, see also \code{\link{join}}
#' @seealso \code{\link{join}}
#' @export
prettify <- function(list_of_surveys,conv_null=TRUE,conv_num=TRUE,join=T){
  if(conv_null)list_of_surveys <- purrr::map(list_of_surveys, null_to_na)
  if(conv_num)list_of_surveys <- purrr::map(list_of_surveys, ~ as.data.frame(purrr::map(., trans_num), stringsAsFactors=FALSE))
  list_of_surveys <- Reduce(function(dtf1,dtf2) dplyr::full_join(dtf1,dtf2,by="session"), list_of_surveys)
  list_of_surveys
}
