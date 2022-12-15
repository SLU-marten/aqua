function (.data)
{
  if (interactive()) {
    tmp <- tempfile(fileext = ".csv")
    readr::write_excel_csv2(.data, tmp)
    fs::file_show(tmp)
  }
  .data
}
