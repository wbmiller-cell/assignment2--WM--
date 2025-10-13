// Individual Assignment 2
clear
import delimited "C:\Users\wbmiller\Downloads\penguins.csv", varnames(1) clear

//data cleaning
foreach v of varlist _all {
	capture repalce `v' = "." if `v" == "NA"'
}

foreach v of varlist _all 
	capture destring `v', replace force
}

//descriptive analysis
//summary statistics
tab1 species island sex year
su bill_depth_mm bill_length_mm flipper_length_mm body_mass_g

//saving results
log using "assignment_2_output.log", replace
tab1 species island sex year
su bill_depth_mm bill_length_mm flipper_length_mm body_mass_g
log close