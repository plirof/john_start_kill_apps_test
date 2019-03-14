<?php

//$date= date('Y-m-d');
$week_of_year_today= intval(date("W", strtotime(date('Y-m-d'))));
//echo date('Y-m-01', strtotime($date));
$school_start_year="2019";
$school_start_date=$school_start_year."-09-10";

function weekOfMonth($date) {
	# Week of the month = Week of the year - Week of the year of first day of month + 1
    //Get the first day of the month.
    $firstOfMonth = strtotime(date('Y-m-01', strtotime($date)));
    //Apply above formula.
    return intval(date("W", strtotime($date))) - intval(date("W", $firstOfMonth)) + 1;
}

function getMonthFromWeek($week_number) {
	#give week of year and get month number
	global $school_start_year;
	$month_num=date("m",strtotime($school_start_year."-W".$week_number."-1"));
    return $month_num;
}

function getMonthQuarterFromWeekNum($week_number) {
	#give week of year and get month number
	global $school_start_year;
	$month_num=date("m",strtotime($school_start_year."-W".$week_number."-1"));
    return $month_num;
}


$week_of_year_sept10= intval(date("W", strtotime($school_start_date)));
$week_of_month_sept10=weekOfMonth($school_start_date);
echo"<br> week_of_year_sept10=$week_of_year_sept10   , week_of_month_sept10=$week_of_month_sept10  ,  week_of_year_today=$week_of_year_today <hr>";




echo "<hr>";
print date("m",strtotime($school_start_year."-W11-1"));
echo "<hr>";
echo getMonthFromWeek($week_of_year_sept10);
echo "<hr>";
echo "<hr>";
echo "<hr>";
echo "<hr>";


?>
<hr>
#
# We get a weeknumber poarameter AND class and we export script line
#

#DAYOFWEEK=$(date "+%A")  
WEEKNUMBER=`date +%V`
#MONTHQUARTERCODE = "febA ,MarC etc..."



#######################  START of  get_script_line() #####################
## Classes A,B
get_script_line_AB() {




#"$MONTHQUARTERCODE" == 'MarB' ||
if [[ "$MONTHQUARTERCODE" == 'MarB' || "$WEEKNUMBER" -eq 11 ]]
then
#---------------------------- Γ1
leafpad "WEEK11 activated 11 --- Week number: $WEEKNUMBER" &
#---------------------------- Γ2

#---------------------------- ΣΤ2

#---------------------------- ΣΤ1
fi

if [[ "$MONTHQUARTERCODE" == 'MarB' || "$WEEKNUMBER" -eq 12 ]]
then
#---------------------------- Γ1
leafpad "WEEK11 activated 12 --- Week number: $WEEKNUMBER" &
#---------------------------- Γ2

#---------------------------- ΣΤ2

#---------------------------- ΣΤ1
fi








return 5
}
#######################  END of  get_script_line() #####################

get_script_line_AB