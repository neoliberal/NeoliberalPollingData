clear all


local date "November2019"

import delimited "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Post-Debate\Recode\\`date'.csv"

local can joebiden petebuttigieg kamalaharris berniesanders elizabethwarren corybooker andrewyang amyklobuchar tomsteyer tulsigabbard

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 60)) ylabel(10 20 30 40 50 60) xscale(range(1 12)) xlabel(1 2 3 4 5 6 7 8 9 10) scheme(economist) title(`"`: var label `var''"') xtitle("Ranked Choice" "← More favorable — Less favorable →")
	graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\\`var'.png", as(png) name("Graph") replace
}

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 60)) ylabel(10 20 30 40 50 60) xscale(range(1 12)) xlabel(2 4 6 8 10) scheme(economist) title(`"`: var label `var''"') xtitle("Ranked Choice")
	graph save Graph "C:\Users\39174\Desktop\neoliberal\graphs\Nov\\`var'.gph", replace
}

cd C:\Users\39174\Desktop\neoliberal\graphs\Nov
local allfiles : dir . files *
graph combine `allfiles', title("November Debate Rankings") scheme(s2color) b2title("← More favorable — Less favorable →") graphregion(color(E. background))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\\`date'.png", as(png) replace

clear all

import excel "C:\Users\39174\Desktop\neoliberal\data\JulySeptOctNov.xlsx", sheet("Sheet2") firstrow

label variable JoeBiden "Biden"
label variable CoryBooker "Booker"
label variable PeteButtigieg "Buttigieg"
label variable KamalaHarris "Harris"
label variable AmyKlobuchar "Klobuchar"
label variable BernieSanders "Sanders"
label variable ElizabethWarren "Warren"
label variable AndrewYang "Yang"
label variable TomSteyer "Steyer"
label variable TulsiGabbard "Gabbard"

graph twoway line ( JoeBiden CoryBooker PeteButtigieg KamalaHarris AmyKlobuchar BernieSanders ElizabethWarren AndrewYang TulsiGabbard TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("All Candidates") scheme(economist) r2title("← Less favored — More favored →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\JulNov.png", as(png) name("Graph") replace



graph twoway line ( JoeBiden CoryBooker PeteButtigieg AmyKlobuchar ElizabethWarren) Month, ytitle("Average Ranking") ysc(reverse) title("Favorites") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\Favorites.png", as(png) name("Graph") replace



graph twoway line (BernieSanders ElizabethWarren AndrewYang TulsiGabbard TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("Progressives and Outsiders") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\ProgressivesOutsiders.png", as(png) name("Graph") replace



graph twoway line (JoeBiden CoryBooker PeteButtigieg KamalaHarris AmyKlobuchar) Month, ytitle("Average Ranking") ysc(reverse) title("Moderates") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\Moderates.png", as(png) name("Graph") replace


graph twoway line (ElizabethWarren JoeBiden BernieSanders PeteButtigieg) Month, ytitle("Average Ranking") ysc(reverse) title("Top Polling Candidates") subtitle("By RCP Average") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Raw\\Top4.png", as(png) name("Graph") replace



* weighted

clear all

import excel "C:\Users\39174\Desktop\neoliberal\data\JulySeptOctNov.xlsx", sheet("Weighted") firstrow


label variable JoeBiden "Biden"
label variable CoryBooker "Booker"
label variable PeteButtigieg "Buttigieg"
label variable KamalaHarris "Harris"
label variable AmyKlobuchar "Klobuchar"
label variable BernieSanders "Sanders"
label variable ElizabethWarren "Warren"
label variable AndrewYang "Yang"
label variable TomSteyer "Steyer"
label variable TulsiGabbard "Gabbard"

graph twoway line ( JoeBiden CoryBooker PeteButtigieg KamalaHarris AmyKlobuchar BernieSanders ElizabethWarren AndrewYang TulsiGabbard TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("All Candidates") scheme(economist) r2title("← Less favored — More favored →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\JulNov.png", as(png) name("Graph") replace



graph twoway line ( JoeBiden CoryBooker PeteButtigieg AmyKlobuchar ElizabethWarren) Month, ytitle("Average Ranking") ysc(reverse) title("Favorites") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\Favorites.png", as(png) name("Graph") replace



graph twoway line (BernieSanders ElizabethWarren AndrewYang TulsiGabbard TomSteyer) Month, ytitle("Average Ranking") ysc(reverse) title("Progressives and Outsiders") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\ProgressivesOutsiders.png", as(png) name("Graph") replace



graph twoway line (JoeBiden CoryBooker PeteButtigieg KamalaHarris AmyKlobuchar) Month, ytitle("Average Ranking") ysc(reverse) title("Moderates") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\Moderates.png", as(png) name("Graph") replace


graph twoway line (ElizabethWarren JoeBiden BernieSanders PeteButtigieg) Month, ytitle("Average Ranking") ysc(reverse) title("Top Polling Candidates") subtitle("By RCP Average") scheme(economist) r2title("← Less favorable — More favorable →") xlabel(, format(%tdMon))
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\\`date'\\Graphs\Weighted\\Top4.png", as(png) name("Graph") replace