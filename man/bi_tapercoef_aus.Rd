% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bi_taper.R
\name{bi_tapercoef_aus}
\alias{bi_tapercoef_aus}
\title{BiTaper Coefficients Australia}
\usage{
bi_tapercoef_aus(species)
}
\arguments{
\item{species}{Eucalyptus species code}
}
\value{
Coefficients for Australian Eucalypts for the Bi model
}
\description{
Coefficients for Australian Eucalypts and P. radiata. Eucalypt coefficients from table 1 in Bi, H; 2000; Trigonometric variable-form taper equations for Australian Eucalypts; Forest Science 46(3) pp397-409.
Radiata coefficients from Table 2 in Bi, H and Long, Y. (2001) Flexible taper equation for site-specific management of Pinus radiata in NSW, Australia For. Ecol. and Management 148
}
\examples{
bi_tapercoef_aus('CMAC')
}