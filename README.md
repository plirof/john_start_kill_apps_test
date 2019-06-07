# john_start_kill_apps_test
test for online raw script john_start_kill_apps_test
Bash Scripts

# JavaSchRuntimeExec.java
This script presents a GUI with 10 options and let you execute bash commands
```bash
javac JavaSchRuntimeExec.java
java JavaSchRuntimeExec
```

# Examples

### Weekday if


```bash
# date --date="1984-12-18" +"%V"

#date "+%A"   : Δευτέρα , Τρίτη , Τετάρτη , Πέμπτη , Παρασκευή 
# echo $(date -d "+1 days" "+%A")
DAYOFWEEK=$(date "+%A")

if [ $DAYOFWEEK == 'Δευτέρα' ] || [ $DAYOFWEEK == 'Monday' ]
then
echo "Δευτέρα"
fi

if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
then
echo "Τρίτη"
fi

if [ $DAYOFWEEK == 'Τετάρτη' ] || [ $DAYOFWEEK == 'Wednesday' ]
then
echo "Τετάρτη"
fi

if [ $DAYOFWEEK == 'Πέμπτη' ] || [ $DAYOFWEEK == 'Thursday' ]
then
echo "Πέμπτη"
fi

if [ $DAYOFWEEK == 'Παρασκευή' ] || [ $DAYOFWEEK == 'Friday' ]
then
echo "Παρασκευή"
fi
```



## FULL WEEK EVENTS / Προγραμματισμός εβδομάδων
```bash
##################  FULL WEEK EVENTS #################################
WEEKNUMBER=`date +%V`
- (in Case we want school order) For example actual week number CONVERT to school week:

#### We want september 11 to bee School week 01 (so we substract current week of year)
#SCHOOLWEEK=$((WEEKNUMBER-35))  
#### After January(next year) add last year LAST week num and substract September 11 weekof previouw year
#SCHOOLWEEK=$((WEEKNUMBER+52-35))  
###if we use SCHOOLWEEK we should probably ZERO WEEKNUMBER=0

# date --date="1984-12-18" +"%V"

# Προγραμματισμός εβδομάδων :
if [ "$WEEKNUMBER" == '12' ] || [ "$WEEKNUMBER" == '13' ] || [ "$SCHOOLWEEK" == '25' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK 12,13 GFX1 ptA, PTB    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFlocal"pack_gfx1.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx1.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx1.html?timer3"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
fi

if [ "$WEEKNUMBER" == '14' ] || [ "$WEEKNUMBER" == '14' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK GFX2 ptA, PTB    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
fi
################## END OF FULL WEEK EVENTS #################################
```

## Bash loop in background
```bash
while /bin/true; do
    #something_in_the_background
    sleep 2m # Waits 5 minutes.
done &
```

### sample implementation:
```bash
# NOTE: Do NOT use this to download BIG files (it might iterate every 2minutes) !!!
probe_the_server()
{
	#every 2 minutes gets the file /swf/john_exec_cmd_on_client.sh and executes it
	# you should call it with probe_the_server &  (to run in background) 
	# SWFlocal="http://192.168.1.200/swf/"
	cd /tmp
	while /bin/true; do
		rm /tmp/john_exec_cmd_on_client.sh		
		#wget http://192.168.1.200/swf/john_exec_cmd_on_client.sh
		wget ""$SWFlocal"john_exec_cmd_on_client.sh" --directory-prefix=/tmp/
		chmod a+x /tmp/john_exec_cmd_on_client.sh
		. /tmp/john_exec_cmd_on_client.sh
	    #something_in_the_background
	    sleep 2m # Waits 5 minutes.
	done &
	return 5
}

probe_the_server &

```

### Update time on clients
Put this somethwhere (eg john_exec_cmd_on_client.sh):
```bash
/usr/sbin/ntpdate 1.gr.pool.ntp.org
```

### Convert school weeks


```bash
#Order of lesson should start from weekOfYear=37 and then from january from weekOfYear=1
# Adjust weeknumber for +- year differences
WEEKNUMBER=$((WEEKNUMBER-1)) 
```

- (in Case we want school order) For example actual week number CONVERT to school week:
```bash
# We want september 11 to bee School week 01 (so we substract current week of year)
WEEKNUMBER=$((WEEKNUMBER-35))  
# After January(next year) add last year LAST week num and substract September 11 weekof previouw year
WEEKNUMBER=$((WEEKNUMBER+52-35))  
```



### BASH increment/dec a variable 

$aa=$aa+1 IS WRONG


CORRECT way :
```bash
WEEKNUMBER=$((WEEKNUMBER-1)) 

```

Other ways that do the same :

```bash
((WEEKNUMBER=WEEKNUMBER-1))
WEEKNUMBER=$((WEEKNUMBER-1)) 
let "WEEKNUMBER=WEEKNUMBER - 1"


var=$((var+1))
((var=var+1))
((var+=1))
((var++))

let "var=var+1"
let "var+=1"
let "var++"


```


###

##



