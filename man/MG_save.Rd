% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wafR_functions.R
\name{MG_save}
\alias{MG_save}
\title{Save plots in the MG report style}
\usage{
MG_save(plt, height, fileName)
}
\arguments{
\item{plt}{ggplot object to be saved}

\item{height}{Height in cm of the figure in the document. A single panel is often 10 cm but greater heights are suggested for multiple panel plots.}

\item{fileName}{File name for the output. Should end with .png}
}
\description{
Convenience function for saving plots in the style needed for the Margules Groome report output. PNG files produced are suitable for copying directly into Word docs.
}
