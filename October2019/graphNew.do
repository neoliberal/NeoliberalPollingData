clear all

import delimited "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\October2019\Post-Debate\Recode\October2019.csv"

local can joebiden petebuttigieg kamalaharris berniesanders elizabethwarren corybooker betoorourke andrewyang amyklobuchar tomsteyer juliancastro tulsigabbard

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 60)) ylabel(10 20 30 40 50 60) xscale(range(1 12)) xlabel(1 2 3 4 5 6 7 8 9 10 11 12) scheme(economist) title(`"`: var label `var''"') xtitle("Ranked Choice" "← More favorable — Less favorable →")
	graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\October2019\Graphs\\`var'.png", as(png) name("Graph") replace
}

foreach var of varlist _all{
	histogram `var' if `var' > 0, discrete percent yscale(range(0 60)) ylabel(10 20 30 40 50 60) xscale(range(1 12)) xlabel(2 4 6 8 10 12) scheme(economist) title(`"`: var label `var''"') xtitle("Ranked Choice")
	graph save Graph "C:\Users\39174\Desktop\neoliberal\graphs\Oct\\`var'.gph", replace
}

cd C:\Users\39174\Desktop\neoliberal\graphs\Oct
local allfiles : dir . files *
graph combine `allfiles', title("October Debate Rankings") scheme(s2color) b2title("← More favorable — Less favorable →")
graph export "C:\Users\39174\Documents\GitHub\NeoliberalPollingData\October2019\Graphs\October.png", as(png) replace

clear all

import excel "C:\Users\39174\Desktop\neoliberal\data\JulySeptOct.xlsx", sheet("Sheet2") firstrow

label variable JoeBiden "Biden"
label variable CoryBooker "Booker"
label variable PeteButtigieg "Buttigieg"
label variable JulianCastro "Castro"
label variable KamalaHarris "Harris"
label variable AmyKlobuchar "Klobuchar"
label variable BetoORourke "O'Rourke"
label variable BernieSanders "Sanders"
label variable ElizabethWarren "Warren"
label variable AndrewYang "Yang"
drop TomSteyer
label variable TulsiGabbard "Gabbard"
replace TulsiGabbard=. if TulsiGabbard==12

graph twoway line (JoeBiden PeteButtigieg ) Month, ytitle("Average Ranking") ysc(reverse)

