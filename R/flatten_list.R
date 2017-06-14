flatten_list <- function(l) {
  s = list();
  for (name in names(l)) {
    if (is.list(l[[name]])) {
      for (n in names(l[[name]])) {
        key = paste0(name, "[", n, "]")
        s[key] = paste(l[[name]][[n]], collapse = ",")
      }
    }
  }
  s
}