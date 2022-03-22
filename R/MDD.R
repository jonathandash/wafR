
#' MDD
#' @description Calculate the plot mean dominant DBH
#' @param DBH Field containing the tree DBHs in cm
#' @param H Field containing the tree heights in m
#' @param plotsize Plot area in ha
#'
#' @return Mean dominant DBH (cm)
#' @export
#'
#' @examples
#' dbh<-runif(20, 20 ,30)
#' h<-runif(20, 25, 35)
#' plot.size <- 0.06
#' mdd(DBH = dbh, H = h, plotsize = plot.size)

mdd = function(DBH,H,plotsize)
{
  treelist = data.frame(DBH,H)
  # calculate the number of trees in the plot - this will need to be change once broken tops have been measured.
  tree_count = length(treelist$DBH)
  # calculate the number of plot trees to include in the mth calculation
  mth_trees = ifelse(tree_count>100*plotsize,100*plotsize,tree_count)

  # calculate the mean of the mth trees in the plots
  return(mean(treelist[order(treelist$DBH),]$DBH[seq.int(to=tree_count, length.out=mth_trees)]))
}
