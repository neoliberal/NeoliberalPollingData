clear all

local date "December2019"

import delimited "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Post-Debate\Recode\\`date'.csv"

local can joebiden petebuttigieg berniesanders elizabethwarren andrewyang amyklobuchar tomsteyer

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 50)) ylabel(10 20 30 40 50) xscale(range(1 7)) xlabel(1 2 3 4 5 6 7) scheme(exponentsmag) title(`"`: var label `var''"') xtitle("Ranked Choice" "← More favorable — Less favorable →")
	graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\\`var'.png", as(png) name("Graph") replace
}

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 50)) ylabel(10 30 50) xscale(range(1 7)) xlabel(1 3 5 7) scheme(exponentsmag) title(`"`: var label `var''"') xtitle("Ranked Choice")
	graph save Graph "C:\Users\39174\Desktop\neoliberal\graphs\Dec\\`var'.gph", replace
}

cd C:\Users\39174\Desktop\neoliberal\graphs\Dec
local allfiles : dir . files *
graph combine `allfiles', title("December Debate Rankings") scheme(s2color) b2title("← More favorable — Less favorable →") graphregion(color(E. background))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\\`date'.png", as(png) replace

clear all

import excel "C:\Users\39174\Desktop\neoliberal\data\JulySeptOctNovDec.xlsx", sheet("Sheet2") firstrow

label variable JoeBiden "Biden"
label variable PeteButtigieg "Buttigieg"
label variable AmyKlobuchar "Klobuchar"
label variable BernieSanders "Sanders"
label variable ElizabethWarren "Warren"
label variable AndrewYang "Yang"
label variable TomSteyer "Steyer"

local date "December2019"

graph twoway line ( JoeBiden PeteButtigieg AmyKlobuchar BernieSanders ElizabethWarren AndrewYang TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("All Candidates") scheme(exponentsmag) r2title("← Less favored — More favored →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\JulDec.png", as(png) name("Graph") replace



graph twoway line ( JoeBiden PeteButtigieg AmyKlobuchar ElizabethWarren) Month, ytitle("Average Ranking") ysc(reverse) title("Favorites") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\Favorites.png", as(png) name("Graph") replace



graph twoway line (BernieSanders ElizabethWarren AndrewYang TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("Progressives and Outsiders") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\ProgressivesOutsiders.png", as(png) name("Graph") replace



graph twoway line (JoeBiden PeteButtigieg AmyKlobuchar) Month, ytitle("Average Ranking") ysc(reverse) title("Moderates") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\Moderates.png", as(png) name("Graph") replace


graph twoway line (ElizabethWarren JoeBiden BernieSanders PeteButtigieg) Month, ytitle("Average Ranking") ysc(reverse) title("Top Polling Candidates") subtitle("By RCP Average") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\Top4.png", as(png) name("Graph") replace



* weighted

clear all

local date "December2019"

import excel "C:\Users\39174\Desktop\neoliberal\data\JulySeptOctNovDec.xlsx", sheet("Weighted") firstrow


label variable JoeBiden "Biden"
label variable PeteButtigieg "Buttigieg"
label variable AmyKlobuchar "Klobuchar"
label variable BernieSanders "Sanders"
label variable ElizabethWarren "Warren"
label variable AndrewYang "Yang"
label variable TomSteyer "Steyer"

graph twoway line ( JoeBiden PeteButtigieg AmyKlobuchar BernieSanders ElizabethWarren AndrewYang TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("All Candidates") scheme(exponentsmag) r2title("← Less favored — More favored →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\JulNov.png", as(png) name("Graph") replace



graph twoway line ( JoeBiden PeteButtigieg AmyKlobuchar ElizabethWarren) Month, ytitle("Average Ranking") ysc(reverse) title("Favorites") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\Favorites.png", as(png) name("Graph") replace



graph twoway line (BernieSanders ElizabethWarren TomSteyer AndrewYang) Month, ytitle("Average Ranking") ysc(reverse) title("Progressives and Outsiders") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\ProgressivesOutsiders.png", as(png) name("Graph") replace



graph twoway line (JoeBiden PeteButtigieg AmyKlobuchar) Month, ytitle("Average Ranking") ysc(reverse) title("Moderates") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\Moderates.png", as(png) name("Graph") replace


graph twoway line (ElizabethWarren JoeBiden BernieSanders PeteButtigieg) Month, ytitle("Average Ranking") ysc(reverse) title("Top Polling Candidates") subtitle("By RCP Average") scheme(exponentsmag) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\Top4.png", as(png) name("Graph") replace