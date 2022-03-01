#' Mean Top Height
#' @description The average height of the primary leaders of the largest 100 trees per hectare where largest is measured in terms of the dbh of the primary leader of that tree.
#'
#' @param DBH Field containing the tree DBH values in cm measured in the plot
#' @param H Field containing the tree height measurements in m.
#' @param plotsize Area of the plot in hectares
#' @export
#' @return The mean top height of the plot.
#' @examples
#' \dontrun{
#' mth(DBH = dbh_m, H = h_m, plotsize = 0.05)
#' }
mth = function(DBH,H,plotsize)
{
  treelist = data.frame(DBH,H)
  # calculate the number of trees in the plot - this will need to be change once broken tops have been measured.
  tree_count = length(treelist$DBH)
  # calculate the number of plot trees to include in the mth calculation
  mth_trees = ifelse(tree_count>100*plotsize,100*plotsize,tree_count)

  # calculate the mean of the mth trees in the plots
  return(mean(treelist[order(treelist$DBH),]$H[seq.int(to=tree_count, length.out=mth_trees)]))
}
