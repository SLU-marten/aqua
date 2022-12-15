#' Open in Excel
#'
#' @param .data A dataframe that will be opened in Excel.
#'
#' @return Same as input
#' @export
#'
#' @examples
#' open_in_excel(iris)
open_in_excel <- function (.data)
{
  if (interactive()) {
    tmp <- tempfile(fileext = ".csv")
    readr::write_excel_csv2(.data, tmp)
    fs::file_show(tmp)
  }
  .data
}
