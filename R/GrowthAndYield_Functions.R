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


#' Stem taper
#'
#' Max and Burkhart taper function with regression coefficients from the
#' South African forestry handbook
#'
#' @param DBH Tree DBH in cm
#' @param H Tree height in m
#' @param h Stem height
#' @param species Tree species
#' @param a1 Equation coefficient
#' @param a2 Equation coefficient
#' @param b5 Equation coefficient
#' @param b6 Equation coefficient
#' @param b7 Equation coefficient
#' @param b8 Equation coefficient
#'
#' @return stem diameter at height h
#' @export
#'
#' @examples
tpr_max_burkhart_safh<-function(DBH,
                       H,
                       h,
                       species,
                       a1,
                       a2,
                       b5,
                       b6,
                       b7,
                       b8)

{

  if(species == "A. mearnsii")
  {

    b5 = -3.547
    b6 = 1.683
    b7 = -1.198
    b8 = 55.754
    a1 = 0.781
    a2 = 0.121

  }else if(species == "E. grandis")
  {
    b5 = -3.942
    b6 = 1.910
    b7 = -1.712
    b8 = 125.128
    a1 = 0.834
    a2 = 0.048
  }else if(species == "E. grandis x urophylla")
  {
    b5 = -1.796
    b6 = 0.649
    b7 = -0.318
    b8 = 119.924
    a1 = 0.819
    a2 = 0.050
  }
  else if(species == "E. macarthurii")
  {
    b5 = -2.832
    b6 = 1.124
    b7 = -0.896
    b8 = 16.228
    a1 = 0.724
    a2 = 0.103
  }else if(species == "P. elliotti")
  {
    b5 = -3.538
    b6 = 1.689
    b7 = -2.237
    b8 = 89.128
    a1 = 0.694
    a2 = 0.069
  }else if(species == "P. patula")
  {
    b5 = -3.268
    b6 = 1.502
    b7 = -1.783
    b8 = 23.772
    a1 = 0.731
    a2 = 0.094
  }else if(species == "P. pinaster")
  {
    b5 = -2.66
    b6 = 1.432
    b7 = -1.572
    b8 = 18.557
    a1 = 0.766
    a2 = 0.117
  }else if(species == "P. radiata")
  {
    b5 = -3.283
    b6 = 1.608
    b7 = -1.287
    b8 = 16.253
    a1 = 0.737
    a2 = 0.079
  }else if(species == "P. taeda")
  {
    b5 = -4.378
    b6 = 2.197
    b7 = -2.651
    b8 = 81.195
    a1 = 0.721
    a2 = 0.071
  }

  l1<-ifelse(h/H<= a1, 1, 0)
  l2<-ifelse(h/H<= a2, 1, 0)

  d2 = DBH^2 * (b5*((h/H) -1) + b6*((h/H)^2 -1) + (b7*(a1 - h/H)^2) * l1 + (b8*(a2 - h/H)^2) *l2)
  d = sqrt(d2)

  return(d)

}
