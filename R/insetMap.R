#' insetMap
#'
#' @param map A ggplot map
#' @param rast A raster defining the inset area
#'
#' @return Map with inset
#' @export
#'
#' @examples
#' insetMap(map)
insetMap <- function (map, rast){
  ins <- sf::st_as_sfc(sf::st_bbox(rast))
  europe <- rnaturalearth::ne_countries(continent = 'europe', returnclass = "sf", scale = "large")
  m2 <- ggplot2::ggplot() +
    ggplot2::geom_sf(data = europe) +
    ggplot2::geom_sf(data = ins, color = "red", fill = NA, size = 0.5) +
    xlim(0, 30) +
    ylim(50, 70) +
    ggthemes::theme_map() +
    ggplot2::theme(panel.background = ggplot2::element_rect(fill = "white"),
          panel.border = ggplot2::element_rect(colour = "black", fill = NA, linewidth  = 1))

 m3 <- cowplot::ggdraw() +
   cowplot::draw_plot(map) +
   cowplot::draw_plot(m2, x = 0.47, y = 0.705, width = 0.3, height = 0.3)

 m3
}
