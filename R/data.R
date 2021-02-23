#' Simple Woodflow example for Marlborough.
#'
#' A dataset containing the recoverable volumes for a scenario in Marlborough. Data extracted from the allrep report.
#'
#' @format A data frame with 62 rows and 10 variables:
#' \describe{
#'   \item{Output}{Output identifier produced by Woodstock}
#'   \item{VariableName}{Name of the variable contained in the value field}
#'   \item{WSR}{Wood supply region}
#'   \item{Species}{Species code}
#'   \item{Ownership}{Ownership code}
#'   \item{Action}{Model action that generated the data}
#'   \item{PeriodText}{Model period when the action occurred}
#'   \item{value}{value of VariableName produced}
#'   \item{Year}{Calendar year when the action occurred}
#'   \item{Scenario}{Wood flow modelling scenario used to generate the data}
#'   ...
#' }
#' @source \url{http://www.margulesgroome.com}
"WAF_allrep"
