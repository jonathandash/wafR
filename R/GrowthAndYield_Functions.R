#' Estimate tree volume
#'
#' Estimate tree volume from DBH and height using functions from the South
#' African Forestry Handbook. These species are available. 'A. mearnsii', 'A. melanoxylon', 'C. equisetifolia', 'E. camaldulensis', 'E. cladocalyx', 'E. diversicolor', 'E. fastigata', 'E. globulus', 'E. grandis', 'E. maculata', 'E. nitens', 'E. grandis x camaldulensis', 'P. canariensis', 'P. caribea', 'P. elliotti', 'P. patula', 'P. pinaster', 'P. radiata', 'P. taeda', 'T. grandis'
#' @param DBH Tree DBH in cm
#' @param H Tree height in m
#' @param coefficients Equation coefficients
#'
#' @return Returns tree volume in cubic metres
#' @export
#'
#' @examples
vol_tree_safh <- function(DBH,
                    H,
                    coefficients)


{
  b0 = coefficients[1]
  b1 = coefficients[2]
  b2 = coefficients[3]
  f = coefficients[4]

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
#' @param coefficients Equation coefficients
#'
#' @return stem diameter at height h
#' @export
#'
#' @examples
tpr_max_burkhart_safh<-function(DBH,
                       H,
                       h,
                       coefficients)
{
  b5 = coefficients[5]
  b6 = coefficients[6]
  b7 = coefficients[7]
  b8 = coefficients[8]
  a1 = coefficients[9]
  a2 = coefficients[10]

  l1<-ifelse(h/H<= a1, 1, 0)
  l2<-ifelse(h/H<= a2, 1, 0)

  d2 = DBH^2 * (b5*((h/H) -1) + b6*((h/H)^2 -1) + (b7*(a1 - h/H)^2) * l1 + (b8*(a2 - h/H)^2) *l2)
  d = sqrt(d2)

  return(d)

}



#' SA Vol TPR coefficients
#' @description Coefficients for the volume and taper equation from the South African Forestry handbook
#' @param species Species code
#'
#' @return Returns equation coefficients for South Africa.
#' @export
#'
#' @examples
#' vol_tpr_coef_sa('EGRA')
vol_tpr_coef_sa = function(species)
{
  if (species == 'EGRA')
  {
    coefficients = c(-9.746, 1.715, 1.107, -2, -3.942, 1.910, -1.712, 125.128, 0.834, 0.048)
  }
  else if (species == 'AMAN')
  {
    coefficients = c(-10.916, 1.953, 1.232, 0, 3.547, 1.683, -1.198, 55.754, 0.781, 0.121)
  }
  else if (species == 'AMEL')
  {
    coefficients = c(-10.491, 1.984, 1.047, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'CEQU')
  {
    coefficients = c(-10.134, 1.714, 1.166, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'ECAM')
  {
    coefficients = c(-9.350, 2.012, 0.691, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'ECLA')
  {
    coefficients = c(-10.398, 1.977, 0.959, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'EDIV')
  {
    coefficients = c(-9.973, 1.920, 0.902, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'EFAS')
  {
    coefficients = c(-11.408 ,2.187, 1.115, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'EGLO')
  {
    coefficients = c(-10.225, 2.043, 0.848, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'EMACU')
  {
    coefficients = c(-11.838, 2.348, 1.041, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'ENIT')
  {
    coefficients = c(-11.906, 2.075, 1.428, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'EGXC')
  {
    coefficients = c(-10.644, 1.918, 1.149, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'PCAN')
  {
    coefficients = c(-10.665, 1.648, 1.359, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'PCAR')
  {
    coefficients = c(-10.665, 1.779, 1.265, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'PELL')
  {
    coefficients = c(-10.677, 1.931, 1.157, 0, -3.538, 1.689, -2.237, 89.128, 0.694, 0.069)
  }
  else if (species == 'PPAT')
  {
    coefficients = c(-13.469, 2.440, 1.325, 8, -3.268, 1.502, -1.783, 23.772, 0.731, 0.094)
  }
  else if (species == 'PPIN')
  {
    coefficients = c(-10.928, 2.070, 0.996, 2, -2.66, 1.432, -1.572, 18.557, 0.766, 0.117)
  }
  else if (species == 'PRAD')
  {
    coefficients = c(-9.965, 1.845, 1.014, 0, -3.283, 1.608, -1.287, 16.253, 0.737, 0.079)
  }
  else if (species == 'PTAE')
  {
    coefficients = c(-11.226, 2.037, 1.82, 0, -4.378, 2.197, -2.651, 81.195, 0.721, 0.071)
  }
  else if (species == 'TGRA')
  {
    coefficients = c(-11.458, 1.908, 1.424, 0, NA, NA, NA, NA, NA, NA)
  }
  else if (species == 'EGXU')
  {
    coefficients = c(NA, NA, NA, NA, -1.796, 0.649, -0.318, 119.924, 0.819, 0.050)
  }
  else if (species == 'EMACA')
  {
    coefficients = c(NA, NA, NA, NA, -2.832, 1.124, -0.896, 16.228, 0.724, 0.103)
  }

  if(coefficients[6] == 'No'){
    print('There is a taper function but no volume function for this species in the SA Forestry Handbook. Choose another species if you want tree volume.')
  }

  if(coefficients[2] == 'No'){

    print('There is a volume function but no taper function for this species in the SA Forestry Handbook. Choose another species if you want tree taper.')

  }

  return (coefficients)
}

