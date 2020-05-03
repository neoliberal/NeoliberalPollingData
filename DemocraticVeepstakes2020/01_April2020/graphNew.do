clear all

import delimited "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\01_April2020\Recode\April.csv", encoding(ISO-8859-9)

local can elizabethwarren kamalaharris staceyabrams gretchenwhitmer amyklobuchar tammyduckworth catherinecortezmasto tammybaldwin michellelujangrisham valdemings

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 40)) ylabel(10 20 30 40) xscale(range(1 10)) xlabel(1 2 3 4 5 6 7 8 9 10) scheme(exponentsmag) title(`"`: var label `var''"') xtitle("Ranked Choice" "← More favorable — Less favorable →")
	graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\\`date'\\Graphs\\`var'.png", as(png) name("Graph") replace
}

label variable elizabethwarren "Warren"
label variable kamalaharris "Harris"
label variable staceyabrams "Abrams"
label variable gretchenwhitmer "Whitmer"
label variable amyklobuchar "Klobuchar"
label variable tammyduckworth "Duckworth"
label variable catherinecortezmasto "Cortez Masto"
label variable tammybaldwin "Baldwin"
label variable michellelujangrisham "Lujan Grisham"
label variable valdemings "Demings"

foreach var of varlist _all{
	histogram `var', discrete percent yscale(range(0 40)) ylabel(10 20 30 40) xscale(range(1 10)) xlabel(2 4 6 8 10) scheme(exponentsmag) title(`"`: var label `var''"') xtitle("Ranked Choice")
	graph save Graph "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\\`date'\\Graphs\Intermediate\\`var'.gph", replace
}

cd "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\\`date'\\Graphs\Intermediate"
local allfiles : dir . files *
graph combine `allfiles', title("April 2020 VP Rankings") scheme(s2color) b2title("← More favorable — Less favorable →") graphregion(color(E. background))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticVeepstakes2020\\`date'\\Graphs\April.png", as(png) replace
