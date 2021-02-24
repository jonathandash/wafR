
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wafR <img src='man/figures/logo.png' align="right" height="50" />

<!-- badges: start -->
<!-- badges: end -->

The goal of wafR is to provide data management and graphing according to
the Margules Groome style guide for outputs from the New Zealand Wood
Availability Forecasts produced by Margules Groome for the NZ Ministry
for Primary Industries (MPI). The Margules Groome team may also find
these functions useful for more general graphing in the house style.

## Installation

This package is not on CRAN.You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jonathandash/wafR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(wafR)
## basic example code

data("WAF_allrep")

volume_graph_bar(data = WAF_allrep,
                 value = value, Year = Year,
                 fillvariable = Ownership,
                 WAF_form = FALSE,
                 Species_select = 'Radiata_pine')
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

volume_graph_bar(data = WAF_allrep,
                 value = value, Year = Year,
                 fillvariable = Ownership,
                 WAF_form = TRUE,
                 Species_select = 'Radiata_pine')
```

<img src="man/figures/README-example-2.png" width="100%" />
