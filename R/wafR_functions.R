# -----------------------------------------------------------------------------
# Functions for the wafR package


#### Set Mag Groome Custom colour plotter ####

# Create a vector of colours from the Margules Groome stationary

MagGroome_colours <- c(
  `mgclgrey` = '#FAFAFA',
  `mgcmgrey` = '#C8C8C8',
  `mgcgrey` = '#969696',
  `mgcdgrey` = '#7f7f7f',
  `mgcyellow` = '#FAFA64',
  `mgclorange` = '#FAC800',
  `mgcorange` = '#FA7D00',
  `mgcllgreen` =  "#C1E089",
  `mgcgreen` = "#006B5B",
  `mgclightgreen` = "#78B142",
  `mgcblue` = "#192F57")


#' Extract Margules Groome colour hex codes
#'
#'Function to extract Margules Groome colours as hex codes
#' @param ... Character name of MagGroome_colors
#' @return hex code for Margules Groome Colour
#' @export
#' @examples
#' MagGroome_cols('mgcblue')
#'
MagGroome_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (MagGroome_colours)

  return(MagGroome_colours[cols])
}


MagGroome_palettes <- list(
  `main`  = MagGroome_cols("mgclgrey", "mgcmgrey",
                           "mgcgrey", "mgcdgrey",
                           "mgcyellow","mgclorange",
                           "mgcorange", "mgcllgreen",
                           "mgcgreen","mgclightgreen",
                           "mgcblue"))


#' Return function to interpolate a Mag Groome color palette
#'
#' @param palette Character name of palette in MagGroome_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
#' @examples
#' MagGroome_pal('main') (10)
#'
MagGroome_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- MagGroome_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


# This can now be used to interpolate colour through the Mag Groome colours and this
# can then be used for custom ggplot scales.



# Now create functions for fill and scolour separately using the Mag Groome colours

#' Color scale constructor for MagGroome colors
#'
#' @param palette Character name of palette in MagGroome_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#' @examples
#' scale_colour_MagGroome()
#'
#'
scale_colour_MagGroome <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- MagGroome_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("MagGroome_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}



#' Fill scale constructor for MagGroome colours
#'
#' @param palette Character name of palette in MagGroome_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#' @examples
#' scale_fill_MagGroome()
#'
scale_fill_MagGroome <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- MagGroome_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("MagGroome_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}



#' Margules Groome general plotting theme for ggplots
#'
#' Function for Margules Groome general plotting theme for ggplots. Once appllied you can further customise using theme
#' @export
#' @importFrom ggplot2 '%+replace%'
#' @examples
#' theme_MagGroome()
#'


theme_MagGroome <- function () {
  ggplot2::theme_bw(base_size=12, base_family="Avenir") %+replace%
    ggplot2::theme(
      legend.position = "top",
      legend.key.size = grid::unit(0.25, "cm"),
      legend.key.width = grid::unit(0.5, "cm"),
      legend.box.background = ggplot2::element_rect(colour = "#7f7f7f"),
      #legend.title = element_blank(),
      panel.border = ggplot2::element_rect(fill=NA,colour = "#7f7f7f",size=0.75,linetype="solid"),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_text(
        size = 9,
        #angle = 90,
        hjust = 1,
        vjust = 0.5,
        colour = 'black'),
      axis.text.y = ggplot2::element_text(colour = 'black'),
      axis.line.x = ggplot2::element_line(color = "#7f7f7f",size=0.1),
      axis.line.y = ggplot2::element_line(color = "#7f7f7f",size=0.1),
      axis.ticks.x = ggplot2::element_line(color = "#7f7f7f",size=0.1),
      axis.ticks.y = ggplot2::element_line(color = "#7f7f7f",size=0.1),

    )
}



