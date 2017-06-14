#' Get raw data from formr
#'
#' \code{get_raw_results} is for internal use of \code{get_one_result} wich is in turn for internl use of \code{get_results}
#' @export
get_raw_results <- function(request = NULL, token = NULL) {
  stopifnot(!is.null(request))
  get_url = formr::formr_api_session()
  if (!is.null(token))
    get_url = token

  query = flatten_list(request)
  query['access_token'] = get_url$query$access_token
  qs = NULL
  for (n in names(query)) {
    qs = paste(qs, paste0(n, '=', query[n]), sep="&")
  }
  # print(qs)
  get_url$path = paste0(get_url$path, "get/results")
  get_url$query = qs
  result = httr::GET(get_url)
  res = httr::content(result)
  res
}
