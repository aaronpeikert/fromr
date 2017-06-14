#' Get results from formr
#' 
#' \code{get_results} returns the data of one or more surveys from one formr run
#' 
#' @param run specify wich formr run should be used (must be one)
#' @param survey specify wich surveys from the specified run should be downloaded (can be more the one in one character vector)
#' @param items currently not used (don't change to something different then null)
#' @param do_prettify should the result be pretty? If you need more controll just call prettify explicitly
#' @seealso \code{\link{prettify}},\code{\link{formr_api_access_token}}
get_results <- function(run,surveys,items=NULL,do_prettify=TRUE){
  message("This may take some time. If you load many or long or surveys with many participants, go grab a coffe.")
  if(is.null(formr::formr_api_session()))stop("\nNo formr session initialized",'\nUse formr_api_access_token(< MyToken1 >,< MyToken2 >)')
  RUN <- run
  SURVEYS <- surveys
  ITEMS <- items
  list_of_surveys <- purrr::map(SURVEYS,function(x)get_one_result(run=RUN,survey = x))
  if(do_prettify)list_of_surveys <-  prettify(list_of_surveys)
  list_of_surveys
}