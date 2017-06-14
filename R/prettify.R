prettify <- function(list_of_surveys,conv_null=TRUE,conv_num=TRUE,join=T){
  if(conv_null)list_of_surveys <- purrr::map(list_of_surveys, null_to_na)
  if(conv_num)list_of_surveys <- purrr::map(list_of_surveys, ~ as.data.frame(purrr::map(., trans_num), stringsAsFactors=FALSE))
  list_of_surveys <- Reduce(function(dtf1,dtf2) full_join(dtf1,dtf2,by="session"), list_of_surveys)
  list_of_surveys
}
