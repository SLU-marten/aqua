#' rasterPlot
#'
#' @param rast The data to be displayed in this layer.
#' @param sluCol Choose color scheme. Valid options are "all", "red", "green", "blue", "yellow" or "grey"
#' @param classMethod Choose raster classification method. If missing the data is plot as continous. Valid options are "fixed", "sd", "equal", "pretty", "quantile", "kmeans", "hclust", "bclust", "fisher", "jenks", "dpih", "headtails", or "maximum"
#' @param nClass number of classes
#'
#' @return A ggplot object
#' @export
#'
#' @examples
#' f <- system.file("external/test.grd", package="raster")
#' r <- raster::raster(f)
#' rasterPlot(rast = r, sluCol = blue, classMethod = "jenks", nClass = 5)
rasterPlot <- function(rast,
                       sluCol = "red",
                       classMethod = FALSE,
                       nClass = 5){
  rast_df <- raster::as.data.frame(rast, xy = TRUE) |>
    na.omit() |>
    dplyr::arrange(desc(names(rast)))
  rast_df$brks <- rast_df[,3]
  disc <- ifelse(classMethod == FALSE, FALSE, TRUE)

  # Classify
  if(classMethod != FALSE){
    rasterClass <- classInt::classIntervals(rast_df[,3], nClass, style = classMethod)
    brks <- rasterClass$brks
    rast_df$brks <- cut(rast_df[,3], breaks = brks)
  }

  p <- ggplot2::ggplot() +
    ggplot2::geom_raster(data = rast_df, ggplot2::aes_string(x="x", y="y", fill = "brks")) +
    SLUcolors::scale_fill_SLU(palette = sluCol, discrete = disc, na.value = "transparent") +
    ggplot2::xlim(min(rast_df$x), max(rast_df$x)) +
    ggplot2::ylim(min(rast_df$y), max(rast_df$y)) +
    ggplot2::theme_classic()
  p
}