#' Predominant Mean Height
#' @description The average height of the primary leaders of the largest 100 trees per hectare where largest is measured in terms of the height of the primary leader of that tree.
#'
#' @param DBH Tree DBH in cm
#' @param H Total tree height in m.
#' @param plotsize Plot area in ha
#' @return The predominant top height of the plot.
#' @export
#' @examples
#' \dontrun{
#' mth(DBH, H, plotsize)
#' }

pdh = function(DBH, H, plotsize)
{
  treelist = data.frame(DBH,H)
  # calculate the number of trees in the plot - this will need to be change once broken tops have been measured.
  tree_count = length(treelist$DBH)
  # calculate the number of plot trees to include in the mth calculation
  mth_trees = ifelse(tree_count< 100*plotsize, 100*plotsize, tree_count)
  # JD added fix to the situation where there are too few trees per plot to meet the requirement for PDH calculation.
  mth_trees2 = ifelse(tree_count< mth_trees, tree_count, mth_trees)
  # calculate the mean of the mth trees in the plots
  return(mean(treelist[order(-treelist$H),]$H[seq.int(to=tree_count, length.out=mth_trees2)]))

}
