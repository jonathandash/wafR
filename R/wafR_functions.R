# -----------------------------------------------------------------------------
# Functions for the wafR package

# Global
`mgclgrey` = '#FAFAFA'
`mgcmgrey` = '#C8C8C8'
`mgcgrey` = '#969696'
`mgcdgrey` = '#7f7f7f'
`mgcyellow` = '#FAFA64'
`mgclorange` = '#FAC800'
`mgcorange` = '#FA7D00'
`mgcllgreen` =  "#C1E089"
`mgcgreen` = "#006B5B"
`mgclightgreen` = "#78B142"
`mgcblue` = "#192F57"


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



#' Margules Groome plotting theme for ggplots
#'
#' Function for Margules Groome general and WAF plotting theme for ggplots. Once appllied you can further customise using theme
#' @export
#' @importFrom ggplot2 '%+replace%'
#' @param WAF Boolean indicating whether plot for WAF reporting or not. Default = FALSE
#' @examples
#' theme_MagGroome(WAF = FALSE)
#'


theme_MagGroome <- function (WAF = FALSE) {
  ggplot2::theme_bw(base_size=12, base_family="Avenir") %+replace%
  if(WAF)
  {

    ggplot2::theme(
      legend.position = "top",
      legend.key.size = grid::unit(0.25, "cm"),
      legend.key.width = grid::unit(0.5, "cm"),
      legend.box.background = ggplot2::element_rect(colour = "#7f7f7f"),
      legend.title = ggplot2::element_blank(),
      panel.border = ggplot2::element_rect(fill=NA,colour = "#7f7f7f",size=0.75,linetype="solid"),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(linetype = "dashed",colour = "#7f7f7f"),
      axis.text.x = ggplot2::element_text(
        size = 9,
        angle = 90,
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

    else
      {
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

}



#### Volume bar graph ####

#' Bar graph showing woodflow volumes
#'
#' Function for plotting bar graphs of volumes from Woodflow model outputs
#' @export
#' @param data Dataframe containing woodflow outputs. This will typically have been produced using e.g. Remsoft Woodstock
#' @param value Column containing values to be plotted on the y-axis. This will typically be volume
#' @param Year Column in df containing values for the x-axis
#' @param WAF_form Boolean indicating whether plot for WAF reporting or not. Default = TRUE
#' @param Species_select Which species is being plotted if this is a WAF report output, Default = 'Radiata_pine'
#' @param fillvariable Variable to use for assigning fill colour to the bar graph
#' @importFrom utils data
#'


volume_graph_bar <- function (data,
                              value,
                              Year,
                              fillvariable,
                              WAF_form = TRUE,
                              Species_select = 'Radiata_pine')

{

  if(WAF_form)
  {

  if(Species_select == 'Douglas-fir')
  {
    limit = 400000
    step_amount = 100000
  }
  else
  {
    limit = 7000000
    step_amount = 1000000
  }
  g = ggplot2::ggplot(data,
             ggplot2::aes(y={{value}}, x={{Year}}, fill = {{fillvariable}})) +
    ggplot2::geom_bar( stat="identity") +
    ggplot2::labs(
      y = base::expression(Recoverable~Volume~(m^3)),
      x = "Year Ending December")  +
    ggplot2::scale_fill_manual(values = c(mgcblue,mgclightgreen, mgcgreen,mgcllgreen,mgcorange)) +
    theme_MagGroome(WAF = TRUE) +
    ggplot2::scale_y_continuous(limit = c(0, limit), breaks=seq(0, limit, step_amount)) +
    ggplot2::scale_x_continuous(breaks=seq(min(data$Year), max(data$Year), 2)) +
    ggplot2::guides(fill = ggplot2::guide_legend(nrow = 1) )
  return (g)
  }

  else
  {

    g = ggplot2::ggplot(data,
                        ggplot2::aes(y={{value}}, x={{Year}}, fill = {{fillvariable}})) +
      ggplot2::geom_bar( stat="identity") +
      ggplot2::labs(
        y = base::expression(Recoverable~Volume~(m^3)),
        x = "Year Ending December")  +
      ggplot2::scale_fill_manual(values = c(mgcblue,mgclightgreen, mgcgreen,mgcllgreen,mgcorange)) +
      theme_MagGroome(WAF = FALSE) +
      #ggplot2::scale_y_continuous(limit = c(0, limit), breaks=seq(0, limit, step_amount)) +
      #ggplot2::scale_x_continuous(breaks=seq(min(data$Year), max(data$Year), 2)) +
      ggplot2::guides(fill = ggplot2::guide_legend(nrow = 1) )
    return (g)

  }

}





