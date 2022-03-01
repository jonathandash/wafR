#' Basal Area - m2/ha
#' @description The basal area is the area of a given section of land that is occupied by the cross-section of tree trunks and stems at the base.
#'
#' @param DBH Field containing the tree DBH in cm
#' @param plotsize Area of the plot in hectares
#' @return The basal area in
#' @export
#' @examples
#' \dontrun{
#' ba(DBH = dbh_2,plotsize = 0.02)
#' }
ba = function(DBH,plotsize)
{
  return (sum((DBH/200)^2*pi, na.rm = TRUE)/plotsize)
}

