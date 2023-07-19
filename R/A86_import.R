#' Import data and
#'
#' @param path location of the raw data.
#' @param lookup an already-imported lookup table dataframe.
#'
#' @return A dataframe.
#' @export
#'
#' @examples
A86_import <- function(path, lookup){
  rawdata <- readxl::read_xlsx(path)
  names(rawdata) <- make.names(names(rawdata))
  data <- dplyr::left_join(rawdata,lookup, by="Animal")
}
