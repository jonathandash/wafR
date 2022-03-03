#' RMSE
#'
#' @description Calculate the RMSE
#'
#' @param predicted Predicted value
#' @param actual Actual values
#'
#' @return Root mean square error
#' @export
#'
#' @examples
RMSE = function(predicted, actual){
  sqrt(mean((predicted - actual)^2))
}
