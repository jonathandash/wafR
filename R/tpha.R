#' TPHA
#'
#' @description Function to return the number of trees per hectare
#' @param TreeNo Tree name
#' @param plotsize Plot size in hectares
#'
#' @return
#' @export
#'
#' @examples
tpha = function(TreeNo,plotsize)
{
  return (length(unique(TreeNo))/plotsize)
}
