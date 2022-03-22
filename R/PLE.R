
#' Standard error
#' @description Calculate the standard error of a sample
#' @param mu The sampled variable. This might commonly be set of values calculated from inventory plots
#'
#' @return The standard error in the same units as mu
#' @export
#'
#' @examples
#' vols<-runif(20, 150, 250)
#' std.err(mu = vols)


std.err<-function(mu)
{

std.err = sd(mu, na.rm=TRUE) / sqrt(length(mu))
return(std.err)

}



#' Confidence interval
#' @description Calculate the confidence limit for a confidence interval around a mean at the 95% confidence level
#' @param mu The sampled variable. This might commonly be set of values calculated from inventory plots
#'
#' @return The confidence limit in the same units as mu
#' @export
#' @import stats
#'
#' @examples
#' vols<-runif(20, 150, 250)
#' conf.int(mu = vols)
#'
conf.int <- function(mu)

{

  conf_int = qt(1 - (0.05 / 2), length(mu) - 1) * (sd(mu, na.rm=TRUE) / sqrt(length(mu)))
  return(conf_int)


}



#' Probably limit of error (PLE) around a mean
#' @description Calculate the PLE around a mean at the 95% confidence level. This statistic is commonly used in forest inventory analysis in NZ and Australia
#' @param mu The sampled variable. This might commonly be set of values calculated from inventory plots
#'
#' @return The PLE in percent
#' @export
#' @import stats
#'
#' @examples
#' vols<-runif(20, 150, 250)
#' ple(mu = vols)
#'
ple<-function(mu)
{

  conf_int = qt(1 - (0.05 / 2), length(mu) - 1) * (sd(mu, na.rm=TRUE) / sqrt(length(mu)))
  ple = (conf_int / mean(mu, na.rm = F)) *100
  return(round(ple, 3))

}



