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




