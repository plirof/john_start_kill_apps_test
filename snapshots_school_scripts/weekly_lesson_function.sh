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