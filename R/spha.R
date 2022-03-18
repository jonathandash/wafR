#' SPHA
#'
#' @description Return stems per hectare
#' @param DBH Field containing the tree DBH in cm
#' @param plotsize Area of the plot in hectares
#'
#' @return Stems per hectare with a DBH greater than 0
#' @export
#'
#' @examples
#' \dontrun{
#' spha(DBH = dap,plotsize = 0.02)
#' }
spha = function(DBH,plotsize)
{
  return (length(subset(DBH,DBH>0))/plotsize)
}
