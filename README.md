
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wafR

<!-- badges: start -->
<!-- badges: end -->

The goal of wafR is to provide data management and graphing according to
the Margules Groome style guide for outputs from the New Zealand Wood
Availability Forecasts produced by Margules Groome for the NZ Ministry
for Primary Industries (MPI). The Margules Groome team may also find
these functions useful for more general graphing in the house style.

## Installation

You can install the released version of wafR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("wafR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jonathandash/wafR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(wafR)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub!
