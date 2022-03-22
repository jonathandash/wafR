#' Basal Area - m2/ha
#' @description The basal area is the area of a given section of land that is occupied by the cross-section of tree stems at breast height.
#'
#' @param DBH Field containing the tree DBH in cm
#' @param plotsize Area of the plot in hectares
#' @return The plot basal area in m2/ha
#' @export
#' @examples
#'
#' dbh = runif(20, 25, 35) # Make an example set of dbhs
#' ba(DBH = dbh,plotsize = 0.02)
#'
ba = function(DBH,plotsize)
{
  return (sum((DBH/200)^2*pi, na.rm = TRUE)/plotsize)
}

