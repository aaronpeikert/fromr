get_one_result <- function(run, survey, items = "") {
  items_to_paste <- paste0("c(", paste0("'", items, "'", collapse =", "), ")")
  text <- stringr::str_c("
                         get_raw_results(list( ## start here with the function
                         run = list(
                         name = '", run, "',
                         sessions = c()
                         ),
                         surveys = list(",
                         survey, " = ", items_to_paste, "
                         )
                         ))", sep="", collapse = ""
  )
  results <- eval(parse(text = text))
  lower_list <- results[[1]]
  result_df <- do.call(rbind, lower_list)
  result_df
}