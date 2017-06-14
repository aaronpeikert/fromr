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