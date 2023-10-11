pwd
cd "Z:\home\gashts\Stata-Fundamentals\lessons"
dir
doedit"01_introduction.do"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
pwd
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
use nlsw88_13, clear
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
des
br
des married_txt
codebook union
misstable summarize
sum wage
sum wage, detail
sum wage if married==1
sum wage if married==1, detail
sum wage if married==2, detail
sum wage if married==1 & collgrade==1
sum wage if married==1 &collgrad==1
sum wage if married==1 | collgrade==1
sum wage if married==1 collgrad==1
sum wage if married==1 | collgrad==1
sum wage if union!=0 & union!=.
tab race
tab collgrad
tab union collgrad
tab union collgrade, col
tab union collgrad,col
tab union collgrad , col row
tab union collgrad, cell
br if industry==Mining
br if industry==Mining
tab industry
tab industry, nolabel
br if industry ==2
codebook industry
label list indlbl
br if industry==2
help tabulate_summarize
tab collgrad, summarize(wage) means
gen year88=1
br
gen wage_day=wage*8
gen tenure_sqr=tenure^2
sum wage if married_text=="Married"
tab married_text
sum wage if married_txt=="Married"
tab married_txt
tab married_txs, nolabel
tab married_txt, nolabel
sum wage if married==1
tab married_txt married
tab married married_txt
tab married_txt
gen married2=1 if married_txt=="M" | married_txt=="Married" | married_txt=="m" 
| married_txt=="maried" | married_txt=="married"
gen married2=1 if married_txt=="M" | married_txt=="Married" | married_txt=="m" ///
| married_txt=="maried" | married_txt=="married"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
gen married2=1 if married_txt=="M" | married_txt=="Married" | married_txt=="m" //
| married_txt=="maried" | married_txt=="married"
gen married2=1 if married_txt=="M" | married_txt=="Married" | married_txt=="m"| married_txt=="maried" | married_txt=="married"
tab married2
replace married2=0 if married_txt=="single" | married_txt=="S" | married_txt=="SINGLE" | married_txt=="Single" | married_txt=="s" | married_txt=="sIngle"
| married_txt=="singLe" | married_txt=="single" | married_txt=="single 
| married_txt=="single" | married_txt==" single" | married_txt=="single
replace married2=0 if married_txt=="single" | married_txt=="S" | married_txt=="SINGLE"| married_txt=="Single" | married_txt=="s" | married_txt=="sIngle" ///
| married_txt=="singLe" | married_txt=="single" | married_txt=="single "
| married_txt=="single  " | married_txt==" single" | married_txt=="singe"
replace married2=0 if married_txt=="single" | married_txt=="S" | married_txt=="SINGLE"| married_txt=="Single" | married_txt=="s" | married_txt=="sIngle"| married_txt=="singLe" | married_txt=="single" | married_txt=="single "
| married_txt=="single" | married_txt==" single" | married_txt=="singe"
replace married2=0 if married_txt=="single" | married_txt=="S" | married_txt=="SINGLE"| married_txt=="Single" | married_txt=="s" | married_txt=="sIngle"|married_txt=="singLe" | married_txt=="single" | married_txt=="single "| married_txt=="single" | married_txt==" single" | married_txt=="singe"
tab married2
dir
doedit "02_data_analysis.do"
doedit "03_programming.do"
do "C:\Users\gasht\AppData\Local\Temp\STD84ac_000000.tmp"
pwd
