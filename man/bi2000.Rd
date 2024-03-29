% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bi_taper.R
\name{bi2000}
\alias{bi2000}
\title{Taper bi2000}
\usage{
bi2000(DBH, h, H, coefficients)
}
\arguments{
\item{DBH}{(diameter at breast height).}

\item{h}{Height for predicted diameter}

\item{H}{Total tree height.}

\item{coefficients}{Equation coefficients}
}
\value{
stem diameter at h
}
\description{
D Bi, H; 2000; Trigonometric variable-form taper equations for Australian Eucalypts; Forest Science 46(3) pp397-409.
}
\examples{
\dontrun{
bi2000(30, 10,40,coefficients = bi_tapercoef_aus('CMAC'))
}
}
