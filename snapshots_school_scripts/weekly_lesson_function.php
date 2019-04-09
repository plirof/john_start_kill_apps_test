<?php
/* 
v190409a - GET first_wk=37&last_wk=53
// example : weekly_lesson_fucktion.php?first_wk=37&last_wk=53    // first_wk=sept10 week number, last_wk last week of year (dec31)


Changes: 

- v190409a - GET first_wk=37&last_wk=53

*/
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

function getMonthNumFromWeekYearNum($week_number) {
	#give week of year and get month number
	global $school_start_year;
	if ($week_number>30) $school_start_year++;
	$month_num=date("m",strtotime($school_start_year."-W".$week_number."-1"));
    return $month_num;
}

function getMonthQuarterFromWeekNum($week_number) {
	#give week of year and get month number
	global $school_start_year;
	if ($week_number>30) $school_start_year++;
	$month_abbr_array=array("zero","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	//$quarter_letter=array("zero","A","B","C","D","E","F");
	$month_num=getMonthNumFromWeekYearNum($week_number);
	//$week_number-weeknumber_of_first_day_of_this_month
	$date_first_of_this_month=$school_start_year."-".$month_num."-01";
	$firstOfMonth = strtotime(date('Y-m-01', strtotime($date_first_of_this_month)));//formats as date the 1st day of given month
	$weekOfMonth=intval($week_number - intval(date("W", $firstOfMonth)) + 1);// 
	$month_quarter=chr(64 + $weekOfMonth); //convert 1,2,3,4,5 to A,B,C,D,E
	$result_month_quarter=$month_abbr_array[intval($month_num)].$month_quarter; // generates JanB, NovC etc...
    return $result_month_quarter;
}




$week_of_year_sept10= intval(date("W", strtotime($school_start_date)));
$week_of_month_sept10=weekOfMonth($school_start_date);
echo"<br> week_of_year_sept10=$week_of_year_sept10   , week_of_month_sept10=$week_of_month_sept10  ,  week_of_year_today=$week_of_year_today <hr>";




echo "<hr>";
//print date("m",strtotime($school_start_year."-W11-1"));
echo "<hr>";
//echo getMonthNumFromWeekYearNum($week_of_year_sept10);
echo "<hr>";
//$month_abbr_array=array("zero","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
//echo $month_abbr_array[03];
echo "<hr>";
echo "<hr>";
echo getMonthQuarterFromWeekNum(45);
echo "<hr> WeekType CONVERTArray:<BR>";

$first_week_sept10=$_GET["first_wk"];
$last_week_of_year=$_GET["last_wk" ];
if(empty($first_week_sept10)) $first_week_sept10=37;
if(empty($last_week_of_year)) $last_week_of_year=53;

//if(empty($_GET["first_wk"])) $first_week_sept10=37;
//if(empty($_GET["last_wk" ])) $last_week_of_year=53;
$week_year2week_sch=array();
$week_sch2week_year=array();

$counter=$first_week_sept10;
for($i=0;$i<38;$i++)
{
	echo '["'.sprintf("%02d", $counter).'"]="'.sprintf("%02d", $i).'" ';
	$week_year2week_sch[sprintf("%02d", $counter)]=sprintf("%02d", $i);
	$week_sch2week_year[sprintf("%02d", $i)]=sprintf("%02d", $counter);
	$counter++;
	if($counter>$last_week_of_year) $counter=01;
}
echo "<hr>";

echo "<hr>week_year2week_sch :<br>";
print_r($week_year2week_sch);
echo "<hr>week_sch2week_year :<br>";
print_r($week_sch2week_year);

?>
<hr size=5>

<hr size=5>
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