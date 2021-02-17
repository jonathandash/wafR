#### Set Mag Groome Custom colour plotter ####
# Create a vector of colours from the Margules Groome stationary

MagGroome_colours <- c(
  `mgclgrey` = '#FAFAFA',
  `mgcmgrey` = '#C8C8C8',
  `mgcgrey` = '#969696',
  `mgcgrey` = '#7f7f7f',
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

  MagGroome_colours[cols]
}




