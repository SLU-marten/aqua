#' mapExtra
#'
#' @param map A ggplot-map
#' @param land Includes a background map
#' @param northArrow Includes a north arrow
#' @param scalebar Includes a scale bar
#'
#' @return Same as input
#' @export
#'
#' @examples
#' mapExtra(map, scalebar = FALSE)
mapExtra <- function (map, land = TRUE, northArrow = TRUE, scalebar = TRUE){
  if(land){
    europe <- rnaturalearth::ne_countries(continent = 'europe', returnclass = "sf", scale = "large")
    map <- map +
      ggplot2::geom_sf(data = europe)
  }
  if(scalebar){
    map <- map +
      ggspatial::annotation_scale(
        location = "bl",
        bar_cols = c("grey60", "white"))
  }
  if(northArrow){
    map <- map +
      ggspatial::annotation_north_arrow(
        location = "bl", which_north = "true",
        # pad_x = unit(0.4, "in")
        pad_y = unit(0.4, "in"),
        style = ggspatial::north_arrow_fancy_orienteering(
          fill = c("grey40", "white"),
          line_col = "grey20")
      )
  }
  map
}
