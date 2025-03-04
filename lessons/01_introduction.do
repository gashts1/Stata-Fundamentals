********************************************************************************
*	STATA FUNDAMENTALS: PART 1 INTRODUCTION									   *
*	D-LAB																	   *
********************************************************************************

********************************************************************************

* Part 1 

* Outline:
* I. 	RUN COMMAND SHORTCUTS + SETTING UP
* II. 	COMMENTING + OPERATORS LIST
* III. 	EXAMINING DATA & DATA CLEANING
*			A. MISSING VALUES
*			B. DESCRIPTIVE STATISTICS
*					(i)  SUMMARIZE
*					(ii) TABULATE
* 					(iii) CROSS-TABULATE
* 			C. CREATING VARIABLES
* VI. 	IMPORTING & EXPORTING 

********************************************************************************


* I. 	RUN COMMAND SHORTCUTS + SETTING UP

******************************************************************************** 
*   						 RUN COMMAND SHORTCUTS 	                           *
********************************************************************************

/* 

	on a mac
	⌘ + Shift + D

	on a windows device
	Cntrl + D 

*/

********************************************************************************
*       						  SETTING UP   						 		   *
********************************************************************************


* clear all previously open data, variables, labels, matrices, memory, etc., 
* and close all open files, graph windows, etc

clear all 



* SET A PROJECT DIRECTORY *

pwd // check the current working directory


* Method: Copy & Paste 

/**** 
		This is not the most efficient method for telling Stata to locate 
		and open your files, but it is the simplest, so we will work with 
		this for day 1 of the workshop                    
****/
	
	


/* Step 1: File > Change Working Directory > Navigate to the folder where you 
   have saved the data file nlsw88.dta */
   
/* Step 2: Copy-paste the last command that shows up on result screen.
   My results window shows this:*/   

cd "Z:\home\gashts\Stata-Fundamentals\lessons"

   
/***
		We paste this command above so that next time we can just run this 
		do-file from the top and it will run smoothly. We will not need to
		use the file menu or copy-paste again. We should be able to run 
		everything from the do-file.
***/


// POLL 1 //

*Run the command "pwd". Is your working directory set to the proper folder on YOUR computer?


*(1) Yes
*(2) No
*(3) Don't know

//


/* Step 3: Open the data file */

use nlsw88.dta , clear // open data file 

/* You can also write: */

use nlsw88 , clear
// don't have to specify .dta, that is the default extension


/***
		If you are using an older version of Stata, then please use:
		
use nlsw88_13, clear
***/





/* 
	Pause here, and now highlight everything above this point and click
	on the "do" button. It should run smoothly! You've started to create a 
	functional do-file!


	Reminder: Save your do file frequently so that you do not lose any
	of  your updates.

*/

********************************************************************************

* II. 	COMMENTING + OPERATORS 

********************************************************************************
*     		    				COMMENTING   		 					       *
********************************************************************************

// There are a bunch of ways to comment your .do file.
// Commenting is key for understanding your work. 

* You can also just put an asterisk at the beginning of a line
* You can use * to comment out lines of code that you want to suspend
// you can use double slash to make comments at the end of a command line or just as a line by itself (like this one)
// asterisk (*) cannot be placed at the end of a command line
des
des // describes the variables in the data
des *  describes the variables in the data  <-- this is wrong!
* des // this suspended the command altogether

/* But then say you wanted to write a really long
and super informative comment that you didn't want 
to have all on one line, like this one we're typing
right now. I am continuing to write my longer comment */




// POLL 2 //


*Which of these include both a command and a comment (and would run the command without error)


*(1) /*clear all – make sure environment is clear before reading in new data*/
*(2) clear all * make sure environment is clear before reading in new data
*(3) *clear all – make sure environment is clear before reading in new data
*(4) // clear all // make sure environment is before reading in new data
*(5) clear all // make sure environment is clear before reading in new data



** CHALLENGE **
/* 
(1) write "describes data" NEXT to the command "des" below as a comment
*/

/*
(2) Suspend all 3 lines of code below using one pair of /**/
*/ 


des 
sum 
count



********************************************************************************
*       					 	  OPERATORS    	  							   *
********************************************************************************
/* 

Very quick rundown of operators in Stata

** Equations ** 

+	plus
-	minus
* 	multiply
/	divide 
^	exponent

= 	equal 

** If Conditions **

&	and
|	or
>	greater than
>=	greater than or equal to
<=	less than or equal to
<	less than 
!	not (also ~)
!=	not equal to (also ~=)
==	logical test for equality (usually follows "if") 

*/

********************************************************************************

* III. 	EXAMINING DATA & DATA CLEANING 

********************************************************************************
*    					EXAMINING A DATA SET: THE BASICS					   *
********************************************************************************

** It is good practice to LOOK at your data before you start working with it
** That way, you get an idea of its shape and the variables in it quickly

* DESCRIBE *

des // describes dataset and variables


* BROWSE *
br // browse data in data editor

**What do the different colors mean?
des married married_txt



* CODEBOOK *

codebook union  // shows the contents of the variable union


// POLL 3 //

*What information is NOT included in the output of the command "codebook"

*(1) variable type
*(2) value labels
*(3) number of observations
*(4) mean
gen

* COUNT *

count // counts the number of observations


** CHALLENGE **
/*
(3) Count the number of observations that are union members.
variable: union
*/


* SUMMARIZE * 

* shows number of observations, mean, min & max of all/some vars 
sum 


* MISSING VALUES *


/* Notice the observation numbers. Why do some variables have fewer observations? */

misstable summarize // tabulates missing values

codebook union 


********************************************************************************
*    		BASIC DESCRIPTIVE STATISTICS: SUMMARIZE & TABULATE   		 	   *
********************************************************************************

* SUMMARIZE *

/*
Now let's start looking at some summary statistics using command: 
"summarize" (or "sum" for short)
*/

sum // summarize the data, presents summary statistics
sum wage
sum wage, detail

* we can combine conditional operators with the summarize command

* What is the average wage of observations who are married in this sample

sum wage if married==1 

* Let's use conditional operators to study different demographic groups in our data

sum wage if married==1 // married
sum wage if collgrad==1 // college graduate
sum wage if married==1 & collgrad==1 // married graduate
sum wage if married==1 & collgrad==0 // married non-graduate
sum wage if married==0 & collgrad==1 // unmarried graduate
sum wage if married==0 & collgrad==0 // unmarried non-graduate
sum wage if married==1 | collgrad==1 // married OR college graduate


/* One basic interpretation from the above descriptive statistics:
For the college graduates in the sample, those who are 
unmarried earn more (11.30) on average than those who are married (10.10).*/



** CHALLENGES **

/*
(4) What is the mean wage for those who are not married?
variables: wage married
(hint: Use the operator "if")
*/


/*
(5) What is the average wage of those who have worked 10 or more years?
variables: wage tenure
*/




/* 
(6) What is the average number of hours worked in the sample? 
variable: hours
*/




/*
(7) What is the average age and age range of this sample? 
Variable: age
*/




/*
(8) What is the average age for non-married observations?
variables: age, married
*/



// Let's look at how missing variables can affect results:

// Suppose we want to summarize wages for those individuals who are in unions (union=1)
// Here are 5 ways you may think to write the code (warning: not all are correct!)

/* A */ sum wage if union>0 
/* B */ sum wage if union!=0 
/* C */ sum wage if union!=0 & union!=. 
/* D */ sum wage if union!=0 & union<. 
/* E */ sum wage if union==1 


// POLL 4 //

*Which of the five options in the do file are correct?  
/*
(1) All 
(2) E, only
(3) A, B
(4) C, D, E
(5) B, C, D
*/


* TABULATION & CROSS TABULATION *



// Very helpful for categorical variables
tab race
tab collgrad
tab union
tab union if hours>=60 & hours<.


* Twoway tables 
tab union collgrad
tab union collgrad, col 
tab union collgrad, row
tab union collgrad, col row

tab union collgrad, cell


// POLL 5 //

*If you wanted to know what percentage of white respondents lived in central cities, what code would you write?
/*
(1) tab race c_city, col
(2) tab race c_city, row
(3) tab c_city race, row
(4) tab c_city race, cell
(5) tab race c_city, cell
*/



** CHALLENGE **
/*
(9) How many observations in this dataset fall into each race group? 
Variables: race
*/




/*
(10) What percent of the sample is white?
Variable: race
*/




* TABULATE, SUMMARIZE *
* Summary statistics of one variable with respect to others 
/* e.g. What is the average wage for married/non-married 
 OR college graduates/non-graduates? */

help tabulate_summarize
tab collgrad, summarize(wage) means
tab married collgrad, summarize(wage) means



** CHALLENGE **

/*
(11) Find average wage by industry.
Variables: industry wage
*/




// do you notice anything strange about the wages here?
// mining wages are the highest??

// Let's explore the mining wage...
// Let's take a look at the observations that work in mining
// first we have to find the industry code that belongs to mining


* Finding numeric codes attached to value labels * 


br if industry==Mining // no luck, industry is a numerical variable
tab industry 
tab industry, nolabel
br if industry==2
/* OR */
// find name of value label 
codebook industry // you can also use: des industry
// then list the contents of that label
label list indlbl
br if industry==2


********************************************************************************
*        			 DATA CLEANING: CREATING VARIABLES   			   	       *
********************************************************************************

* CREATE VARIABLES *

// We will show 3 different methods:
// (1) Creating simple numeric variables (constants and simple mathematical transformations)
// (2) Creating a numeric  variable from a string variable (manual labor and advanced)
// (3) Creating a numeric indicator variable from another numeric variable 


* (1) Simple numeric variables

gen year88=1

gen wage_day = wage*8 // wage per day (8 hour workday)

gen tenure_sqr = tenure^2



* (2) Turning our string variable into a numeric variable

* Why do we want to convert a string to a numeric variable? Example:

sum wage if married_txt=="Married"
sum wage if married == 1

*Do you see any issues that might arrise from using a string variable?
tab married_txt married 


/*	Method 1: manual labor	*/


*Remember married and married_txt?
tab married married_txt
tab married_txt

gen married2=1 if married_txt=="M" | married_txt=="Married" | married_txt=="m" ///
	| married_txt=="maried" | married_txt=="married"
	
replace married2=0 if married_txt=="single" | married_txt=="S" | married_txt=="SINGLE" ///
	| married_txt=="Single" | married_txt=="s" | married_txt=="sIngle" ///
	| married_txt=="singLe" | married_txt=="single" | married_txt=="single " ///
	| married_txt=="single  " | married_txt==" single" | married_txt=="single   "
	
encode married_txt, gen(married3) // good when strings are clean

gen married_txt2 = married_txt
replace married_txt2=trim(married_txt2) // removes leading and trailing spaces
replace married_txt2=proper(married_txt2)
replace married_txt2=lower(married_txt2)
replace married_txt2=upper(married_txt2)


/*	Method 2 (advanced!): regular expressions	*/


/*
Regular expressions are one way that you can work with strings in variables
Regular expressions are methods that allows for searching, matching and replacing within strings.
There are two main commands: regexr and regexm.

regexr REPLACES a value within a string with a new variable

regexm, which we'll use today, combines strings and conditional operators.
regexm lets you search within a string for a given character; it returns 1, or 
TRUE, if the string has the character, and 0 otherwise.
*/

gen married4=1 if regexm(married_txt,"m") | regexm(married_txt,"M")
replace married4=0 if regexm(married_txt,"s") | regexm(married_txt,"S")

*See how this differs from the string Married variable?
br  married_txt married2 married3 married4

tab married married2



/*	Method 3: create numeric variables from other numeric variables	  */

// create a variable that indicates highschool graduate
// Be careful to think about 
// (1) missing values 
// (2) what should =1 and what should =0 for your variable

//let's first look at grade
codebook grade
// it has missing values, so beware


// version 1
gen hs1 = 1 if grade>=12 & grade!=. 
replace hs1 = 0 if grade<12


// version 2
gen hs2 = (grade>=12 & grade!=.)
// this assigns 1 to the observations meeting the condition in the () and 0 to all else

// version 3
recode grade (0/11 = 0) (12/18 = 1), gen(hs3) 


//check all 3 versions
sum hs1 hs2 hs3
sum hs*


// Why is hs2 different?
br grade hs* if hs2!=. & hs1==.


// Could we have generated hs2 a different way to fix it?
drop hs2

gen hs2 = (grade>=12) if grade!=. 

count if hs1!=hs2

// drop the extraneous versions
drop hs2 hs3


// POLL 6 //

*We want to create a variable indicating if people worked full time (40 hrs or more). Which option would NOT generate this variable properly?

/*
(1)  gen full_time=hours>=40
(2)  gen full_time=hours>=40 if hours<.
(3) recode hours (0/39 = 0) (40/80=1), gen(full_time)
*/



// Let's tabulate our new variable
tab hs1
// we can make this variable more informative...


* LABEL VARIABLES AND ADD VALUE LABELS *



// Let's rename hs1 as hs
rename hs1 hs

// Let's add a label to hs1
label variable hs "high school graduate"
label variable hs "High school graduate"

// Next, let's add a value label for each of the 2 values of hs
/* This requires TWO steps: 
	(1) create a separate value label assigning labels to 0 and 1
	(2) add that value label to the variable hs
*/

// Let's define a value label called YN
label define hs_vallabel 1 "High school graduate" 0 "Did not graduate high school" 

// Now, let's assign the value label YN to the variable hs
label values hs hs_vallabel 

// Check that the label has been applied
tab hs 

// Remember that we can always check the contents of a value label with label list
label list hs_vallabel


// POLL 7 //

*We want to see the value labels and the values that they correspond to for the variable hs. Which option would NOT show us this?
/*
(1) br hs
(2) label list
(3) label list hs_vallabel
(4) tab hs
(5) codebook hs
*/



** CHALLENGE **

/*
Let's make and label a new variable about college attendance.
(12a)	Create a variable called somecollege, i.e. more than 12 and less than 
	16 years of schooling) (call it somecollege, using any of the three methods 
	we used to create hs.
*/




/*
(12b) Label somecollege "Attended some years of college" 
*/




/*
(12c) Create a new value label called somecollege_vallabel that assigns labels to 1 and 0
*/




/*
(12d) Add your new value label to somecollege and check it has added
*/




* RE-ORDERING VARIABLES *

* Re-ordering how variables appead in the dataset
order hs, before(collgrad)



* SAVING CHANGES TO FILE *

* Save changes to a NEW file
save "nlsw88_clean" , replace
// why don't we want to save changes to the original file?

 

********************************************************************************

* VI. 	IMPORTING & EXPORTING 


********************************************************************************
*     			 			EXPORTING AND IMPORTING   			   	           *
********************************************************************************


* Export data for use with other programs
help export excel
export delimited using "nlsw88_clean.csv", replace datafmt
export delim "nlsw88_clean.csv", replace dataf
export delim "nlsw88_clean.csv", replace nolabel

export delimited using "nlsw88_clean.tsv", delimiter(tab) replace  datafmt

export excel using "nlsw88_clean.xlsx", firstrow(variables) replace  
export excel using "nlsw88_clean.xlsx", replace   

* Import data from excel sheet into stata as nlsw88_clean.xlsx

// Let's first clear the current data in memory
clear all

// import the data file you just exported to excel as nlsw88_clean.xlsx
import excel using "nlsw88_clean.xlsx", first clear
import excel "/Users/isabellecohen/Dropbox/DLab/Stata Fundamentals I/nlsw88_clean.xlsx", sheet("Sheet1") firstrow clear



