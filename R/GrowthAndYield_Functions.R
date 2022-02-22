#' Estimate tree volume
#'
#' Estimate tree volume from DBH and height using functions from the South
#' African Forestry Handbook. These species are available. 'A. mearnsii', 'A. melanoxylon', 'C. equisetifolia', 'E. camaldulensis', 'E. cladocalyx', 'E. diversicolor', 'E. fastigata', 'E. globulus', 'E. grandis', 'E. maculata', 'E. nitens', 'E. grandis x camaldulensis', 'P. canariensis', 'P. caribea', 'P. elliotti', 'P. patula', 'P. pinaster', 'P. radiata', 'P. taeda', 'T. grandis'
#' @param DBH Tree DBH in cm
#' @param H Tree height in m
#' @param species Tree species
#' @param b0 Equation coefficient
#' @param b1 Equation coefficient
#' @param b2 Equation coefficient
#' @param f Form factor modifier from handbook
#'
#' @return Returns tree volume in cubic metres
#' @export
#'
#' @examples
vol_tree_safh <- function(DBH,
                    H,
                    species = 'E. grandis',
                    b0 = -9.746,
                    b1 = 1.715,
                    b2 = 1.107,
                    f = -2)


{
  if(species == "E. grandis")
  {

    b0 = -9.746
    b1 = 1.715
    b2 = 1.107
    f = -2

  }else if(species == 'A. mearnsii')
  {

    b0 = -10.916
    b1 = 1.953
    b2 = 1.232
    f = 0
  }else if(species == 'A. melanoxylon')
  {

    b0 = -10.491
    b1 = 1.984
    b2 = 1.047
    f = 0
  }else if(species == 'C. equisetifolia')
  {

    b0 = -10.134
    b1 = 1.714
    b2 = 1.166
    f = 0
  }else if(species == 'E. camaldulensis')
  {

    b0 = -9.350
    b1 = 2.012
    b2 = 0.691
    f = 0

  }else if(species == 'E. cladocalyx')
  {

    b0 = -10.398
    b1 = 1.977
    b2 = 0.959
    f = 0
  }else if(species == 'E. diversicolor')
  {

    b0 = -9.973
    b1 = 1.920
    b2 = 0.902
    f = 0
  }else if(species == 'E. fastigata')
  {

    b0 = -11.408
    b1 = 2.187
    b2 = 1.115
    f = 0
  }else if(species == 'E. globulus')
  {

    b0 = -10.225
    b1 = 2.043
    b2 = 0.848
    f = 0
  }else if(species == 'E. maculata')
  {

    b0 = -11.838
    b1 = 2.348
    b2 = 1.041
    f = 0

  }else if(species == 'E. nitens')
  {

    b0 = -11.906
    b1 = 2.075
    b2 = 1.428
    f = 0
  }else if(species == 'E. grandis x camaldulensis')
  {

    b0 = -10.644
    b1 = 1.918
    b2 = 1.149
    f = 0
  }else if(species == 'P. canariensis')
  {

    b0 = -10.665
    b1 = 1.648
    b2 = 1.359
    f = 0
  }else if(species == 'P. caribea')
  {

    b0 = -10.665
    b1 = 1.779
    b2 = 1.265
    f = 0
  }else if(species == 'P. elliotti')
  {

    b0 = -10.677
    b1 = 1.931
    b2 = 1.157
    f = 0
  }else if(species == 'P. patula')
  {

    b0 = -13.469
    b1 = 2.440
    b2 = 1.325
    f = 8
  }else if(species == 'P. pinaster')
  {

    b0 = -10.928
    b1 = 2.070
    b2 = 0.996
    f = 2
  }else if(species == 'P. radiata')
  {

    b0 = -9.965
    b1 = 1.845
    b2 = 1.014
    f = 0
  }else if(species == 'P. taeda')
  {

    b0 = -11.226
    b1 = 2.037
    b2 = 1.82
    f = 0
  }else if(species == 'T. grandis')
  {

    b0 = -11.458
    b1 = 1.908
    b2 = 1.424
    f = 0
  }

  lnV = b0 + b1*log(DBH + f)+ b2 * log(H)
  #return(lnV)
  V = exp(lnV)
  return(V)

}
