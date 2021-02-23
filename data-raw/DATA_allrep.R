## code to prepare `WAF_allrep` dataset goes here

library(tidyverse)

options(scipen = 999)


WAF_allrep<-readRDS('C:/Users/Jonat/Dropbox (MGC)/NZX000550 MPI Wood Availability Forecasts/Working Files/RCode/dashboard_development/app_data/df_MPI_WAF_2020_allrep_out.rds')


WAF_allrep<-WAF_allrep %>%
  filter(VariableName == 'oTRV', WSR == 'Marlborough', Species == 'Radiata_pine', Ownership != "NA",Action == "Clearfell", Scenario == 'S1')


usethis::use_data(WAF_allrep, overwrite = TRUE)
