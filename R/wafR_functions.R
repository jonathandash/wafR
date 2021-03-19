# -----------------------------------------------------------------------------
# Functions for the wafR package

# Global
#`mgclgrey` = '#FAFAFA'
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
  #`mgclgrey` = '#FAFAFA',
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
  `main`  = MagGroome_cols("mgcmgrey",
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
  ggplot2::theme_bw(base_size=12, base_family="sans") %+replace%
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
#' @param WAF_form True/False indicating whether plot for WAF reporting or not. Default = TRUE
#' @param Species_select Which species is being plotted if this is a WAF report output, Default = 'Radiata_pine'
#' @param fillvariable Variable to use for assigning fill colour to the bar graph
#' @param ylim Maximum value for the y axis
#' @importFrom utils data
#' @examples
#' data("WAF_allrep")
#'
#' volume_graph_bar(data = WAF_allrep,
#' value = value, Year = Year,
#' fillvariable = Ownership,
#' WAF_form = TRUE,
#' Species_select = 'Radiata_pine')
#'


volume_graph_bar <- function (data,
                              value,
                              Year,
                              fillvariable,
                              WAF_form = TRUE,
                              Species_select = 'Radiata_pine',
                              ylim = 7000000)

{

  if(WAF_form)
  {

  if(Species_select == 'Douglas-fir')
  {
    limit = ylim
    step_amount = 100000
  }
  else
  {
    limit = ylim
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



#### Volume line graph ####

#' Line graph showing woodflow volumes
#'
#' Function for plotting line graphs of volumes from Woodflow model outputs
#' @export
#' @param data Dataframe containing woodflow outputs. This will typically have been produced using e.g. Remsoft Woodstock
#' @param value Column containing values to be plotted on the y-axis. This will typically be volume
#' @param Year Column in df containing values for the x-axis
#' @param WAF_form True/False indicating whether plot for WAF reporting or not. Default = TRUE
#' @param Species_select Which species is being plotted if this is a WAF report output, Default = 'Radiata_pine'
#' @param colourvariable Variable to use for assigning fill colour to the bar graph
#' @param ylim Maximum value for the y axis
#' @importFrom utils data
#'


volume_graph_line <- function (data,
                              value,
                              Year,
                              colourvariable,
                              WAF_form = TRUE,
                              Species_select = 'Radiata_pine',
                              ylim = 700000)

{

  if(WAF_form)
  {

    if(Species_select == 'Douglas-fir')
    {
      limit = ylim
      step_amount = 100000
    }
    else
    {
      limit = ylim
      step_amount = 1000000
    }
    g = ggplot2::ggplot(data,
                        ggplot2::aes(y={{value}}, x={{Year}}, colour = {{colourvariable}})) +
      ggplot2::geom_line() +
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
                        ggplot2::aes(y={{value}}, x={{Year}}, colour = {{colourvariable}})) +
      ggplot2::geom_line() +
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


#' Line graph showing clearfell ages
#'
#' Function for plotting line graphs of clearfell ages from Woodflow model outputs
#' @export
#' @param data Dataframe containing woodflow outputs. This will typically have been produced using e.g. Remsoft Woodstock
#' @param value Column containing values to be plotted on the y-axis. This will typically be volume
#' @param Year Column in df containing values for the x-axis
#' @param WAF_form Boolean indicating whether plot for WAF reporting or not. Default = TRUE
#' @param colourVariable Variable to use for assigning fill colour to the bar graph
#' @importFrom utils data
#'


clearfellAge_line <- function(data,
                              Year,
                              value,
                              colourVariable,
                              WAF_form)

{

  if(WAF_form)
  {

  g<-ggplot2::ggplot(data,
            ggplot2::aes(y={{value}}, x={{Year}}, color = {{colourVariable}}, size = factor({{colourVariable}}))) +
    ggplot2::geom_line() +
    ggplot2::scale_size_manual("Ownership", values = c(0.8, 0.4), guide = "none") +
    ggplot2::labs(
      y = 'Mean clearfell age (y)',
      x = "Year Ending December")  +
    ggplot2::scale_colour_manual(values = c( mgcblue,mgclightgreen, mgcgreen,mgcllgreen,mgcorange)) +
    theme_MagGroome(WAF = TRUE) +
    ggplot2::scale_y_continuous(limit = c(0, 50), breaks=seq(0, 50, 5)) +
    ggplot2::scale_x_continuous(breaks=seq(min(data$Year), max(data$Year), 2)) +
    ggplot2::guides(fill = ggplot2::guide_legend(nrow = 1))


  return(g)

  }

  else

  {

    g<-ggplot2::ggplot(data,
                       ggplot2::aes(y={{value}}, x={{Year}}, color = {{colourVariable}}, size = factor({{colourVariable}}))) +
      ggplot2::geom_line() +
      ggplot2::scale_size_manual("Ownership", values = c(0.8, 0.4), guide = "none") +
      ggplot2::labs(
        y = 'Mean clearfell age (y)',
        x = "Year Ending December")  +
      ggplot2::scale_colour_manual(values = c( mgcblue,mgclightgreen, mgcgreen,mgcllgreen,mgcorange)) +
      theme_MagGroome(WAF = FALSE) +
      ggplot2::scale_y_continuous(limit = c(0, 50), breaks=seq(0, 50, 5)) +
      ggplot2::scale_x_continuous(breaks=seq(min(data$Year), max(data$Year), 2)) +
      ggplot2::guides(fill = ggplot2::guide_legend(nrow = 1))


    return(g)

  }


}


#' Line graph showing yield tables
#'
#' Function for plotting line graphs of clearfell ages from Woodflow model outputs
#' @export
#' @param data Dataframe containing woodflow outputs. This will typically have been produced using e.g. Remsoft Woodstock
#' @param value Column containing values to be plotted on the y-axis. This will typically be volume
#' @param Year Column in df containing values for the x-axis
#' @param WAF_form Boolean indicating whether plot for WAF reporting or not. Default = TRUE
#' @param colourVariable Variable to use for assigning fill colour to the bar graph
#' @importFrom utils data
#'

YT_graph_line <- function(data,
                          Year,
                          value,
                          colourVariable,
                          WAF_form)
{

  if(WAF_form)
  {
  g = ggplot2::ggplot(data,
             ggplot2::aes(y={{value}}, x={{Year}}, colour = {{colourVariable}})) +
    ggplot2::geom_line() +
    ggplot2::labs(
      y = expression(Recoverable~Volume~(m^3)),
      x = "Age")  +
    ggplot2::scale_colour_manual(values = c(mgcblue, mgcllgreen, mgcgreen,mgcorange)) +
    theme_MagGroome(WAF = TRUE) +
    ggplot2::scale_y_continuous(limit = c(0, 1000), breaks=seq(0, 1000, 100)) +
    # scale_y_continuous(limit = c(0, limit), breaks=seq(0, limit, step_amount),labels = number) +
    ggplot2::scale_x_continuous(breaks=seq(10,60,2 ))
  return (g)

  }



  else

  {
    g = ggplot2::ggplot(data,
                        ggplot2::aes(y={{value}}, x={{Year}}, colour = {{colourVariable}})) +
      ggplot2::geom_line() +
      ggplot2::labs(
        y = expression(Recoverable~Volume~(m^3)),
        x = "Age")  +
      ggplot2::scale_colour_manual(values = c(mgcblue, mgcllgreen, mgcgreen,mgcorange)) +
      theme_MagGroome(WAF = FALSE) +
      ggplot2::scale_y_continuous(limit = c(0, 1000), breaks=seq(0, 1000, 100)) +
      # scale_y_continuous(limit = c(0, limit), breaks=seq(0, limit, step_amount),labels = number) +
      ggplot2::scale_x_continuous(breaks=seq(10,60,2 ))
    return (g)

  }

}


#' Save plots in the MG report style
#'
#' Convenience function for saving plots in the style needed for the Margules Groome report output. PNG files produced are suitable for copying directly into Word docs.
#' @export
#' @param plt ggplot object to be saved
#' @param height Height in cm of the figure in the document. A single panel is often 10 cm but greater heights are suggested for multiple panel plots.
#' @param fileName File name for the output. Should end with .png
#'

MG_save <- function(plt, height, fileName)

{

  ggplot2::ggsave(plt,
         width = 14.2,
         height = height,
         dpi = 600,
         units = c("cm"),
         filename = here::here(fileName))

}


#' Identify outliers
#'
#' Function that identifies whether observations are outliers.
#' @export
#' @param x The variable of interest
#' @param type Choose whether to identify 'high', 'low', or 'both' types of outliers. Default is 'both'.
#' @param outlier_range The number of times outside the IQR that an observation is deemed to be an outlier. Default = 1.5.
#' @examples
#' x <- rnorm(n = 1000, mean = 100) # Create a normally distributed dataset
#'
#' is_outlier(x) # Find outliers
#'
#' boxplot(x) # Plot x to visualise the outliers


is_outlier <- function(x, type = 'both', outlier_range = 1.5)

  {

  if(type == 'low')
  {

  return(x < stats::quantile(x, 0.25) - outlier_range * stats::IQR(x))

  }

  if(type == 'high')
  {

  return(x > stats::quantile(x, 0.75) + outlier_range * stats::IQR(x))

  }

  if(type == 'both')

    return(x < stats::quantile(x, 0.25) - outlier_range * stats::IQR(x) | x > stats::quantile(x, 0.75) + outlier_range * stats::IQR(x))

  }



#' Prepare WAF allrep data
#'
#' Function that transforms data from the allrep output of Remsoft Woodstock
#' @export
#' @param df The WAF allrep file.
#' @param startYear Simulation start year.
#' @param cutOverYear simulation cutover year.


prepare_WAF_allrep<- function(df, startYear, cutOverYear)

  {

  g<-tidyr::pivot_longer(data = df, cols=!c(Output,Description), names_to = "PeriodText", values_to = "value") %>%
  dplyr::mutate(Year = base::as.numeric(base::gsub("[^[:digit:].]", "",  PeriodText)) + startYear) %>%
  tidyr::separate(Description, c("VariableName","WSR", "Species","Ownership", "Action"), sep=" ") %>%
  dplyr::mutate(Scenario = Scenario) %>%
  dplyr::mutate(Ownership = ifelse(Ownership == 'Large', 'Large-Scale Owners',
                            ifelse(Ownership == 'Small', 'Small-Scale Owners', NA))) %>%
  dplyr::filter(Year >= startYear,Year <= cutOverYear)

  return(g)

  }


#' Shift legend
#'
#' Shift legend into empty facets in a multipanel ggplot.
#' @export
#' @param p The ggplot2 multi-panel object.
#' @importFrom graphics layout
#' @importFrom stats setNames


shift_legend <- function(p) {
  pnls <- cowplot::plot_to_gtable(p) %>% gtable::gtable_filter("panel") %>%
    with(setNames(grobs, layout$name)) %>% purrr::keep(~identical(.x,zeroGrob()))

  if( length(pnls) == 0 ) stop( "No empty facets in the plot" )

  lemon::reposition_legend( p, "center", panel=names(pnls) )
}





