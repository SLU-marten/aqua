#' Open in Excel
#'
#' @name open_in_excel
#'
#' @param .data A data.frame that you want to open in excel
#'
#' @return Returns same data as input
#' @export
#'
#' @examples
#' open_in_excel(iris)
function (.data)
{
  if (interactive()) {
    tmp <- tempfile(fileext = ".csv")
    readr::write_excel_csv2(.data, tmp)
    fs::file_show(tmp)
  }
  .data
}
