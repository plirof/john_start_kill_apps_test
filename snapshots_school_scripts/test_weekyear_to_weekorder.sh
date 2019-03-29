declare -a WkOrderToWeekOfYearArray;
#WkOrderToWeekOfYearArray=( ELEMENT_1 ELEMENT_2 ELEMENT_N ) 
# years 2019-2020  10sept2019=Triti
WkOrderToWeekOfYearArray=( 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25) 
# years 2020-2021 (sept 10 is thuesday so we start from -actual - 2nd week)
#WkOrderToWeekOfYearArray=( 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24) 

echo ${WkOrderToWeekOfYearArray[0]} 

echo ${WkOrderToWeekOfYearArray[28]}

echo ${WkOrderToWeekOfYearArray[37]} 
WEEKNUMBER=1000

if [ "$WEEKNUMBER" == ${WkOrderToWeekOfYearArray[28]} ] || [ "$WEEKNUMBER" == '38' ]
then
#--------------------- this is for Full week-all classes events    
leafpad "typing pt1 wl02 activated --- Week number: $WEEKNUMBER" &

fi

echo "WkOfYeartoWkOrderArray"
#declare -A WkOrderToWeekOfYearArray
declare -A WkOfYeartoWkOrderArray=( ["37"]="00" ["38"]="01" ["39"]="02" ["40"]="03" ["41"]="04" ["42"]="05" ["43"]="06" ["44"]="07" ["45"]="08" ["46"]="09" ["47"]="10" ["48"]="11" ["49"]="12" ["50"]="13" ["51"]="14" ["52"]="15" ["53"]="16" ["01"]="17" ["02"]="18" ["03"]="19" ["04"]="20" ["05"]="21" ["06"]="22" ["07"]="23" ["08"]="24" ["09"]="25" ["10"]="26" ["11"]="27" ["12"]="28" ["13"]="29" ["14"]="30" ["15"]="31" ["16"]="32" ["17"]="33" ["18"]="34" ["19"]="35" ["20"]="36" ["21"]="37" )
echo "${WkOfYeartoWkOrderArray[42]}"