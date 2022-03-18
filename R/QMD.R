#' Quadratic mean DBH
#' @description Calculate the quadratic mean DBH
#'
#' @param DBH tree DBH values
#'
#' @return Quadratic mean DBH
#' @export
#'
#' @examples
#' \dontrun{
#' QMD(DBH = dap)
#' }
QMD <- function(DBH){

  D = sqrt(sum(DBH^2, na.rm = TRUE) / length(DBH))

  return(D)

}
