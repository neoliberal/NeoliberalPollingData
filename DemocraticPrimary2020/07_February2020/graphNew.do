clear all

local date "07_February2020"
local fi "February2020"

import delimited "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Post-Debate\Recode\\`fi'.csv"

local can joebiden petebuttigieg berniesanders elizabethwarren amyklobuchar tomsteyer

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 50)) ylabel(10 20 30 40 50) xscale(range(1 6)) xlabel(1 2 3 4 5 6) scheme(exponentsmag) title(`"`: var label `var''"') xtitle("Ranked Choice" "← More favorable — Less favorable →")
	graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\\`var'.png", as(png) name("Graph") replace
}

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 50)) ylabel(10 30 50) xscale(range(1 6)) xlabel(1 2 3 4 5 6) scheme(exponentsmag) title(`"`: var label `var''"') xtitle("Ranked Choice")
	graph save Graph "C:\Users\39174\Desktop\neoliberal\graphs\Feb\\`var'.gph", replace
}

cd C:\Users\39174\Desktop\neoliberal\graphs\Feb
local allfiles : dir . files *
graph combine `allfiles', title("February 2020 Debate Rankings") scheme(s2color) b2title("← More favorable — Less favorable →") graphregion(color(E. background))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\\`date'.png", as(png) replace



* weighted

clear all

local date "07_February2020"

import excel "C:\Users\39174\Desktop\neoliberal\data\JulySeptOctNovDecJanFeb.xlsx", sheet("Weighted") firstrow


label variable JoeBiden "Biden"
label variable PeteButtigieg "Buttigieg"
label variable AmyKlobuchar "Klobuchar"
label variable BernieSanders "Sanders"
label variable ElizabethWarren "Warren"
label variable TomSteyer "Steyer"

graph twoway line ( JoeBiden PeteButtigieg AmyKlobuchar BernieSanders ElizabethWarren TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("All Candidates") scheme(exponentsmag) r2title("← Less favored — More favored →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\Weighted\\JulFeb.png", as(png) name("Graph") replace



graph twoway line ( JoeBiden PeteButtigieg AmyKlobuchar ElizabethWarren) Month, ytitle("Average Ranking") ysc(reverse) title("Favorites") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\Weighted\\Favorites.png", as(png) name("Graph") replace



graph twoway line (BernieSanders ElizabethWarren TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("Progressives and Outsiders") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\Weighted\\ProgressivesOutsiders.png", as(png) name("Graph") replace



graph twoway line (JoeBiden PeteButtigieg AmyKlobuchar) Month, ytitle("Average Ranking") ysc(reverse) title("Moderates") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\Weighted\\Moderates.png", as(png) name("Graph") replace


graph twoway line (ElizabethWarren JoeBiden BernieSanders PeteButtigieg) Month, ytitle("Average Ranking") ysc(reverse) title("Top Polling Candidates") subtitle("By RCP Average") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\DemocraticPrimary2020\\`date'\\Graphs\Weighted\\Top4.png", as(png) name("Graph") replace