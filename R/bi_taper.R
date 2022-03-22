#' Taper bi2000
#' @description D Bi, H; 2000; Trigonometric variable-form taper equations for Australian Eucalypts; Forest Science 46(3) pp397-409.
#'
#' @param DBH (diameter at breast height).
#' @param H Total tree height.
#' @param h Height for predicted diameter
#' @param coefficients Equation coefficients
#' @return stem diameter at h
#' @export
#' @examples
#' \dontrun{
#' bi2000(30, 10,40,coefficients = bi_tapercoef_aus('CMAC'))
#' }
bi2000 <- function(DBH,h,H,coefficients)
{
  T = h/H

  b0 = coefficients[1]
  b1 = coefficients[2]
  b2 = coefficients[3]
  b3 = coefficients[4]
  b4 = coefficients[5]
  b5 = coefficients[6]
  b6 = coefficients[7]
  w = 1.3/H
  EE = 0.001

  xx = ifelse(log(abs(sin(T*(pi/2))+EE))/log(abs(sin(w*(pi/2))+EE))<0,0,log(abs(sin(T*(pi/2))+EE))/log(abs(sin(w*(pi/2))+EE)))
  p1 = b0 + b1 * sin(T * pi/2) + b2 * cos(3 * T * pi/2) + b3 * sin(T * pi/2)/(T + EE)
  p2 = b4 * DBH + b5 * T * sqrt(DBH) + b6 * T * sqrt(H)
  d = DBH * ifelse(xx<=0,0,xx^(p1 + p2))
  #d = DBH * xx^(b0 + b1*sin((pi/2)*T)+b2*cos(3*(pi/2)*T)+b3*sin((pi/2)*T)/(T+b4)*DBH+b5*T*sqrt(DBH)+b6*T*sqrt(H))
  return(d)
}





#' Taper bi2000 squared
#' @description Internal function to be integrated for the integration of the Bi 2000 volume function
#' @param DBH Tree DBH in cm
#' @param h Stem diameter height in m
#' @param H Tree height in m
#' @param coefficients equation coefficients
#'
#' @return squared stem diameter at h
#' @export
#'
#' @examples
#' \dontrun{
#' bi2000_squared(30, 10,40,coefficients = bi_tapercoef_aus('CMAC'))
#' }
bi2000_squared = function(DBH,h,H,coefficients)
{

  return(bi2000(DBH,h,H,coefficients)*bi2000(DBH,h,H,coefficients))

}



#' Volume bi2000
#' @description D Bi, H; 2000; Trigonometric variable-form taper equations for Australian Eucalypts; Forest Science 46(3) pp397-409.
#'
#' @param DBH Tree diameter at breast height in cm
#' @param stump_height Tree stump height in m
#' @param h Height for predicted diameter
#' @param H Tree height in m
#' @param coefficients Equation coefficients
#'
#' @return Stem volume
#' @export
#' @importFrom stats integrate
#'
#' @examples
#'
#' bi2000_volume(30,0.3, 40,40,coefficients = bi_tapercoef_aus('CMAC'))
#'
#'
bi2000_volume = function(DBH,stump_height,h,H,coefficients)
{

  return(try(integrate(bi2000_squared,stump_height,h,DBH=DBH,H=H,coefficients=coefficients)[1]$value*(pi/40000)))
}


#' BiTaper Coefficients Australia
#' @description Coefficients for Australian Eucalypts and P. radiata. Eucalypt coefficients from table 1 in Bi, H; 2000; Trigonometric variable-form taper equations for Australian Eucalypts; Forest Science 46(3) pp397-409.
#' Radiata coefficients from Table 2 in Bi, H and Long, Y. (2001) Flexible taper equation for site-specific management of Pinus radiata in NSW, Australia For. Ecol. and Management 148
#'
#' @param species Eucalyptus species code
#'
#' @return Coefficients for Australian Eucalypts or P.radiata for the Bi model
#' @export
#'
#' @details Species available are 'CGUM', 'CMAC', 'EAGG', 'EBAD', 'ECAM', 'ECYP', 'EDAL', 'EDEL', 'EELA', 'EFRA', 'EGLO', 'ENIT', 'EOBL', 'EPAU', 'EPIP', 'EPIL', 'ESAL', 'ESIE', 'ESMI', 'ESPP' - (all eucalypts), 'PRAD'
#'
#' @examples
#' bi_tapercoef_aus('CMAC')
bi_tapercoef_aus = function(species)
{
  if (species == 'CGUM')
  {
    coefficients = c(1.5745, -0.4691, -0.0995, -0.8095, 0.0028, 0.0468, -0.0489)
  }
  else if (species == 'CMAC')
  {
    coefficients = c(0.9477, -0.1125, -0.0050, -0.4595, -0.0018, 0.0731, -0.0632)
  }
  else if (species == 'EAGG')
  {
    coefficients = c(1.9268, -0.4932, -0.0437, -0.9866, 0.0020, 0.0348, -0.0617)
  }
  else if (species == 'EBAD')
  {
    coefficients = c(1.6678, -0.1985, -0.0214, -0.9098, -0.0003, 0.0603, -0.0872)
  }
  else if (species == 'ECAM')
  {
    coefficients = c(0.8364, 0.2216, -0.0031, -0.4110, 0.0015, 0.0547, -0.1332)
  }
  else if (species == 'ECYP')
  {
    coefficients = c(0.4361, 0.1186, 0.0552, -0.1528, -0.0011, 0.0641, -0.0632)
  }
  else if (species == 'EDAL')
  {
    coefficients = c(0.8266, -0.3792, -0.0470, -0.3323, -0.0022, 0.0342, 0.0367)
  }
  else if (species == 'EDEL')
  {
    coefficients = c(1.2992, -0.0564, 0.0096, -0.7248, 0.0017, -0.0099, -0.0254)
  }
  else if (species == 'EELA')
  {
    coefficients = c(1.2717, 0.2267, 0.0515, -0.6965, -0.0003, 0.0955, -0.1777)
  }
  else if (species == 'EFAS')
  {
    coefficients = c(0.7965, 0.0513, 0.0312, -0.3703, -0.0011, 0.0737, -0.0874)
  }
  else if (species == 'EFRA')
  {
    coefficients = c(1.1467, -0.0718, 0.0048, -0.6167, 0.0015, 0.0201, -0.0424)
  }
  else if (species == 'EGLO')
  {
    coefficients = c(1.0495, -0.2678, -0.0062, -0.4681, -0.0025, 0.1120, -0.0905)
  }
  else if (species == 'EMUE')
  {
    coefficients = c(1.9618, -0.5850, -0.0783, -0.9549, -0.0004, 0.0826, -0.0953)
  }
  else if (species == 'ENIT')
  {
    coefficients = c(0.9654, 0.0889, 0.0329, -0.5134, 0.0004, 0.0496, -0.0833)
  }
  else if (species == 'EOBL')
  {
    coefficients = c(0.5744, 0.2210, 0.0748, -0.2838, 0.0001, 0.0554, -0.0863)
  }
  else if (species == 'EPAN')
  {
    coefficients = c(1.3308, -0.2888, -0.0334, -0.6855, -0.0008, 0.1121, -0.1022)
  }
  else if (species == 'EPAU')
  {
    coefficients = c(1.1689, 0.3397, 0.0372, -0.6628, 0.0043, 0.0675, -0.2003)
  }
  else if (species == 'EPIL')
  {
    coefficients = c(1.0546, -0.2531, -0.0168, -0.4707, -0.0020, 0.0880, -0.0711)
  }
  else if (species == 'EPIP')
  {
    coefficients = c(0.5564, -0.1492, 0.0162, -0.1696, -0.0015, 0.0696, -0.0349)
  }
  else if (species == 'ERAD')
  {
    coefficients = c(0.7775, 0.1525, 0.0025, -0.3706, 0.0004, 0.0683, -0.1247)
  }
  else if (species == 'ESAL')
  {
    coefficients = c(1.0391, -0.5304, -0.0298, -0.4386, -0.0017, 0.0565, 0.0128)
  }
  else if (species == 'ESCI')
  {
    coefficients = c(0.2577, 0.2832, 0.0692, -0.0243, -0.0090, 0.1519, -0.1540)
  }
  else if (species == 'ESIE')
  {
    coefficients = c(0.8948, -0.0415, 0.0349, -0.3895, -0.0004, 0.0744, -0.0951)
  }
  else if (species == 'ESMI')
  {
    coefficients = c(1.9891, -0.5870, -0.0256, -0.9106, -0.0020, 0.0863, -0.0927)
  }
  else if (species == 'ESPP')
  {
    coefficients = c(0.9834, 0.1636, 0.0406, -0.4887, 0.0006, 0.1178, -0.1874)
  }
  else if (species == 'EVIM')
  {
    coefficients = c(1.3184, -0.0296, 0.0158, -0.7196, 0.0012, 0.0420, -0.0847)
  }
  else if (species == 'PRAD')
  {
    coefficients = c(0.82183, -0.10193, -0.00872, -0.37145, -0.00112, 0.03741, -0.03672)
  }

  return (coefficients)
}


