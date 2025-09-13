# Script 
#To Do:
# - Figure why RUFFLE runs very SLOW on clients (on server it runs OK) (check week 21). I use both iron for swf & google for wasm games 
# - RUFFLE problems(HW accel disabled) in PCs:02(p4-e5200),04b(e4400),6amd,7b(E6500), ,9(e8200-butRunsFast),,12(e6500but runs faster)
# - Ruffle HW accell ok : PC03b,05(miniPC),8(e8400),10b(c6400),11(e7400) 
#

#changes
#250524 - added adjustWeekFinalNum_for_week 999 in the end and modified csv2html to detect that
#250319 - added ab/netsmartkids to week 13
#250316  - week 12 pack_giortes25March.html
#250120  - week 4 : Added as comments link to youtube for zxbasic lessons , pack_A01 A-B: lesson is on week 4 
#v241121 - week 48 disabled eduactiv8 and now use gcompris (3rd lesson) (TEST)
#v241029 - enabled load_extra_apps (before olohmero check at start): loads john_extra_apps.sh which loads extra apps for the current day
#v241021 - Added \&showsubmit in all tinymce
#v240520b- Week 21 uses BOTH iron + google chrome & works !PROBLEM: RUFFLE RUNS VERY SLOW (HW acceleration warning)
#v240515 - Some fix summer/winter time tests (not good)
#v240414 - Activated Easter auto calculation
#v240329 - Cause of Easter big difference , copied weeks 18-20 to 14-17
#v240303 - Fix APOKRIESPREWEEK_02 variable error (question: tsiknopempti should be 1st or 2nd week?)
#v240227 - Apokries Week 1 - added TAB with Directkidspedia  url
#v231110d- week 47-48 added codeorg_playlab
#v231105c- Week44-47 switched to googlehomestartincognito and ruffle for code.org(iron can't open) ,also added tee no-default-browser-check
#v231010c- minor fixes week39-44 , replaced pack_param with pack_typing,pack_maze1,2,pack_parking
#v230920b- minor fixes week39 , week 38  pack_A07
#v230515b- weeks 21,22 added/mod excel spreadsheet
#v230401 - fix week 17
#v230301 - fix v2 googlehomestartincognito()
#v230220 - fixed googlehomestartincognito()
#v230110 - Google Chrome now expires in 2099 : --simulate-outdated-no-au='4074664805000' 
#v230122 - week 4 changed to pack_a01,pack_paint1 and zx_htm2tap 
#v230110 - Changed some scripts to local instead of Github
#v221127 - Added Google Chrome ,$IRON_OPTIONS/$FLASH_OPTIONS (not used at the moment - might not be needed)
#v221106 - $CHROME_OPTIONS Functions : Ironstart & ironstartingognito uses 
#v221102 - CHROME --test-type (to hide --no-sandbox message in Iron)
#v221013 - IMPLEMENT google-chrome-stable-puppy-home.sh --start-maximized https://make.gamefroot.com/games/new
#v220929 - added ?showsubmit to week 39 of tinymce_submit.html 
#v220927 - Added iron browser params (CHROME_OPTIONS="-no-default-browser-check --disable-gpu --start-maximized")
#v220508 - Updated week 18 & 19 (after easter)
#v220406 - Minor updates
#v220112 - Added 32bit & 64bit specific extra code
#v211125 - eduactiv8 comments for Lesson1,2  , now run sudo -u puppy bash -c "/opt/eduActiv8/eduActiv8 &";
#v211120 - weeks 45-48 november added another visible level to each week
#v211113 - weeks 45-48 (november) added pack_codeorg1.html?showdiv1&showdiv2&showdiv3
#v211102 - added  --start-maximized to normal iron
#v211021 - Adjusted weeks 42.43.44. Maze2 is interchanged with 28Oct-preWeek and Oct28+park1+halloweenDraw
#v211017 - Moved olohmero BEFORE giortes
#v211014 - amixer set Master mute 
#v211004 - added repeat command to all days
#v211003 - minor modifications , (tried started using ;!!;!!;!! (for repeating same command command)NOT working)
#v210930a - added  --start-maximized
#v210908c - funbrain.html now loads from root (swf/funbrain.html - NOT from /ab/funbrain.com/ 2.labrat CheatGR1 3.changed pack_param to typing_bricks__puzzle!!!.swf
#v210908 -  added Default -always show entry + adjusted week38 with Initial week (tinymce type name)
#v210817 - changed pixbot.patatakia to pixbot.dimotika (patatakia expired)
#v210518 -  fix crash flash/iron mod : added  --disable-gpu  to ingognito
#v210505  - 2021-2022 giortes Parameter set , added slimjet-puppy-home.sh / slimjetstartincognito()  {}
#v210201a - added /& norightclick to some options
#v210111a - Replaced $1 with $@ to iron browser functions to fix different behaviour in iron32 & iron64 (untested)
#v201012a - added 28oct jspaint(v01),tinymce word
#v200916b - added olohmero check (check day + if hour passed 13:15)
#v200908a - added funbrain to first lesson
#v200903  dim101-21 new year start (COVID 14sept start year)
#v200419 adjustWeekFinalNum_for_week() , also added Constants for Giortes
#v200301 if..then..fi needs something inside or it produces errors (added echo "empty line") PROGLEM of Weeks 03-09 EXISTS AGAIN
#v200217 fixed error in week 08 ,apokries-pasxa -added tinymce (weeks01-09tempfix)
#v200107 : temp hardcoded fix : first 9 weeks (o..9) have problem Cause of the starting 0  : 02==2  , 03==3

calceasterweeknum() { #Problem NOT USED
#CALC__CURRENT EASTER WEEK NUMBER: 
AAA=`date +%Y` ;
 BBB=`ncal -e $AAA` ;CCC=`date --date=$BBB +'%d/%m/%y' ` ;
  echo "BBB=$BBB CCC=$CCC";date --date=$CCC +%V;
  EASTER_WEEK_CALCULATED=`date --date=$CCC +%V`
  echo "Current Easter week: $EASTER_WEEK_CALCULATED";
return $EASTER_WEEK_CALCULATED
}


function get_easter_week() {
    local year=$1
#   declare -A easter_dates
# Προσθέστε ζευγάρια έτος-εβδομάδας για το Πάσχα (Manual corrected 2028,33,36,38)
#easter_dates+=([2025]="16" [2026]="15" [2027]="18" [2028]="16" [2029]="14")
#easter_dates+=([2030]="17" [2031]="16" [2032]="14" [2033]="16" [2034]="16")
#easter_dates+=([2035]="18" [2036]="16" [2037]="15" [2038]="17" [2039]="16")
    case $year in
      2029|2032) echo 14; ;;
      2026|2037) echo 15; ;;
      2025|2028|2031|2033|2034|2036|2039) echo 16; ;;
      2038|2030) echo 17; ;;
      2024|2027|2035) echo 18; ;;
      *) echo 16; ;;
    esac
    return;
}


# this modifies the weekofyear (eg +1,-1)
STARTWEEKCOUNT=0

# *** NOTE : "$SERVER" for IRON BROWSER should be WITHOUT (s) 

#Default Chrome Options
mkdir -p /etc/chromium.d ;tee /etc/chromium.d/disable-set-default-browser; #--no-default-browser-check
CHROME_OPTIONS=" --no-default-browser-check --start-maximized --test-type "
CHROME_ONLY_OPTIONS=" --simulate-outdated-no-au=4074664805000 " # NOT used yet " --simulate-outdated-no-au='4074664805000' "
#Flash options (for IRON v61)
FLASH_OPTIONS=" --ppapi-flash-path=/usr/share/iron_flash/extensions/libpepflashplayer.so --ppapi-flash-version=31.0.0.108 "
IRON_OPTIONS= " --disable-gpu --disable-features=TranslateUI --disable-features=Translate --disable-translate ""$FLASH_OPTIONS"


#CHROME_OPTIONS="-no-default-browser-check --disable-gpu --start-maximized --test-type --disable-features=InfiniteSessionRestore --disable-session-crashed-bubble --hide-crash-restore-bubble --hide-restore-last-session "
#/appimages/Internet/ungoogled-chromium_119.0.6045.199-1.1.AppImage http://192.168.1.200/tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy\&file=xmas_rudolf #Runs Ungoogled chroimum appimage

# kill firefox (if you want )
#pkill -f firefox
#pkill -f chrome
#clear cache
#rm -rf /mnt/home/downloads_linux/.cache/iron_flash/
CURRENT_YEAR=`date +%Y`;
EASTER_WEEK_THIS_YEAR=$(get_easter_week $CURRENT_YEAR)
# SPECIAL WEEKS (ADJUCT THESE TO CURRENT SCHOOL YEAR EG 2021-22) NOTE!!!! use double digit eg 05
APOKRIES_PREWEEK_01=08 # τσικνοπεμπτη 2025 week 8; Γιορτάζεται κάθε χρόνο την Πέμπτη, 11 ημέρες πριν από την Καθαρά Δευτέρα
APOKRIES_PREWEEK_02=09
EASTER_PREWEEK_01=$((EASTER_WEEK_THIS_YEAR - 2))  # week16 (num-2) in 2024 (Easter week is 18)
EASTER_PREWEEK_02=$((EASTER_WEEK_THIS_YEAR - 1))
XMAS_PREWEEK_01=50
XMAS_PREWEEK_02=51
XMAS_AFTER_01=02
RECYCLE_DAY=00
INTERNET_SAFETY_01=00
INTERNET_SAFETY_02=00
# 28 October: weeks 42,43,44 are interchanged Park(with oct text) is on the week of the vacation, Maze2 +Oct28 is exhanged
OCT28_PREWEEK=43
OCTOBER28=$((OCT28_PREWEEK+1))
#HALLOWEEN_ENGLISH_WEEK_01=43
#leafpad "oct28= "$OCTOBER28 &
MARCH25=12
#leafpad "cur_year-"$CURRENT_YEAR"-"$EASTER_WEEK_THIS_YEAR"-week:-"$EASTER_PREWEEK_01 &
# allow apps running without --no-sandbox  (https://www.reddit.com/r/debian/comments/hkyeft/unable_to_run_appimage_applications_without/?rdt=53846)
# NOTE 2test might create issues when Epoptes Share screen ### sudo sysctl -w kernel.unprivileged_userns_clone=1 ;

#mute all Clients
amixer set Master mute
#set python 3 as default
#update-alternatives --install /usr/bin/python python /usr/bin/python3 1 # NOTE Causes Epoptes problems

#restore volume/unmute Master&Speaker 
#amixer -c 0 set Master playback 100% unmute ;amixer -c 0 set Speaker playback 100% unmute ;

#fix for 32bit WINE


#################### Execute stuff if 32bit or 64bit#####################################################
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64-bit stuff here
touch "/tmp/64bit_OS_detected" &
#leafpad "/tmp/64bit_OS_detected" &
#mkdir -p /appimages; ln -s /mnt/home/downloads_linux/appimages /appimages/wine; #create /appimages if not exist and make link there
WINE_APPIMAGE_PATH="/mnt/home/downloads_linux/appimages/"
rm /appimages
ln -s /mnt/home/downloads_linux/appimages/wine-staging-linux-x86-v5.11-PlayOnLinux-x86_64.AppImage
 /usr/bin/wineserver;
 ln -s /mnt/home/downloads_linux/appimages/wine-staging-linux-x86-v5.11-PlayOnLinux-x86_64.AppImage
 /usr/bin/wine;
 ln -s /mnt/home/downloads_linux/appimages/wine-staging-linux-x86-v5.11-PlayOnLinux-x86_64.AppImage
 /usr/bin/wine32;
ln -s /mnt/home/downloads_linux/appimages/ /appimages
else
  # 32-bit stuff here
touch "/tmp/32bit_OS_detected"   &
# leafpad "/tmp/32bit_OS_detected"   &
ln -s /usr/bin/wineserver32 /usr/bin/wineserver
fi
####################END of Execute stuff if 32bit or 64bit#####################################################


#ironstart https://studio.code.org/s/course1
#ironstart https://studio.code.org/s/course1/stage/4/puzzle/10
#ironstart https://studio.code.org/s/course1/stage/7/puzzle/10
#dim-worklog.matheme.win

SERVER="http://192.168.1.200/";
CODEorg=https://studio.code.org/s/course1/stage/
LANDINGpages=""$SERVER"uploads/landing_pages/"
SWFlocal=""$SERVER"swf/"
SWFpath=""$SERVER"swf/"
SWFgiortes=""$SERVER"swf/swf_giortes/"
#---------
GAMESEDU=""$SERVER"gamesedu/"
GAMESEDUtortuga=""$GAMESEDU"tortuga-kids-logo-gr"
GAMESEDUtank=""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
#----------

OOOKIDS="ooo4kids1.3 -n "
OOOKIDSpathprefix="/opt/lampp/htdocs/askiseis_office/"
RAMKIDpathprefix=""$SERVER"ramkid/"

#date "+%A"   : Δευτέρα , Τρίτη , Τετάρτη , Πέμπτη , Παρασκευή 
# echo $(date -d "+1 days" "+%A")
DAYOFWEEK=$(date "+%A")  
WEEKNUMBER=`date +%V`

# date --date="1984-12-18" +"%V"
###date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z" ; hwclock --systohc;
#sudo date MMDDhhmmYYYY
#sudo date 100412482024;sudo hwclock --systohc;
#date '+%H:%M' -d "$(curl -sI 192.168.1.200 | grep 'Date:' | cut -d' ' -f3-)" #240515 PROB? this gets server time
#sudo date -s "$(date '+%H:%M' -d "$(curl -sI 192.168.1.200 | grep 'Date:' | cut -d' ' -f3-)")" #  #240515 PROB? this gets server time
# To avoid Week Choosing :
#WEEKNUMBER=99



WEEKFINALNUM=0
# Calculate the WeekLesson to start : $STARTWEEKCOUNT + Normal Lesson Week)
adjustWeekFinalNum_for_week() {
# adjustWeekFinalNum_for_week 5 = $WEEKFINALNUM adjustWeekFinalNum_for_week 5))
WEEKFINALNUM=$(($STARTWEEKCOUNT+$1));printf -v WEEKFINALNUM "%02d" $WEEKFINALNUM
echo "DEBUG adjustWeekFinalNum_for_week() WEEKFINALNUM return ="$WEEKFINALNUM
return 5
}

load_extra_apps(){
# used to activate events (eg pasxa, halloween, etc)	
cd /tmp
wget ""$SERVER"uploads/john_extra_apps.sh" --directory-prefix=/tmp/
chmod a+x /tmp/john_extra_apps.sh
. /tmp/john_extra_apps.sh

}



ironstart() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
#. iron_flash_puppy_pepper_home.sh " --disable-gpu --start-maximized ""$@"

# OK BEFORE implemnting Global $CHROME_OPTIONS
#. iron_flash_puppy_pepper_home.sh " --disable-gpu --start-maximized --disable-session-restore --disable-restore-session-state --noerrdialogs --disable-session-crashed-bubble ""$@"

# 221106
. iron_flash_puppy_pepper_home.sh "$CHROME_OPTIONS""$IRON_OPTIONS"" --disable-session-restore --disable-restore-session-state --noerrdialogs --disable-session-crashed-bubble ""$@"


return 5
}

ironstartincognito() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
###ok##. iron_flash_puppy_pepper_home.sh " --disable-gpu --incognito --start-maximized ""$@"
. iron_flash_puppy_pepper_home.sh "$CHROME_OPTIONS""$IRON_OPTIONS"" --incognito ""$@"
return 5
}

ironchangesdat() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper.sh "$CHROME_OPTIONS""$IRON_OPTIONS"" --disable-gpu --incognito --start-maximized ""$@"
return 5
}



# GOOGLE CHROME latest ############################
googlehomestartincognito() {
# PROBLEM incognito does not work (ok?)
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
###. google-chrome-stable-puppy-home.sh --incognito --start-maximized --simulate-outdated-no-au='407466480500'"$CHROME_OPTIONS $CHROME_ONLY_OPTIONS" "$@"
#tee /etc/chromium.d/disable-set-default-browser
#. google-chrome-stable-puppy-home.sh --incognito --start-maximized "$CHROME_ONLY_OPTIONS" "$CHROME_OPTIONS" "$@"
. google-chrome-stable-puppy.sh --incognito --start-maximized ""$CHROME_ONLY_OPTIONS"" ""$CHROME_OPTIONS"" "$@"
###. google-chrome-stable-puppy-home.sh "$CHROME_OPTIONS $CHROME_ONLY_OPTIONS"" --incognito ""$@"
#. google-chrome-stable-puppy-home.sh "$CHROME_OPTIONS $CHROME_ONLY_OPTIONS"" --incognito --start-maximized ""$@"
return 5
}

googlehomestart() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. google-chrome-stable-puppy-home.sh "$CHROME_OPTIONS"" --start-maximized --simulate-outdated-no-au='4074664805000' ""$@"
return 5
}

googlechangesdat() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. google-chrome-stable-puppy.sh "$CHROME_OPTIONS"" --start-maximized --simulate-outdated-no-au='4074664805000' ""$@"
return 5
}



slimjetstartincognito() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. slimjet-puppy-home.sh "$CHROME_OPTIONS""--incognito  --start-maximized ""$@"
return 5
}

slimjetstart() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. slimjet-puppy-home.sh "--start-maximized ""$CHROME_OPTIONS""$@"
return 5
}

oookidsopen()
{
# eg oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
$OOOKIDS$OOOKIDSpathprefix"$@"
return 5
}

lightbot_iron_browser() {
# NOTE : ONLY foir custom MAPS. for normal just run : . iron_flash_puppy_pepper_home.sh "--incognito "$SERVER"gamesedu/lightbot_haan/
# eg  lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito "$SERVER"gamesedu/lightbot_haan/index.php?map=""$1"
. iron_flash_puppy_pepper_home.sh "$CHROME_OPTIONS""$IRON_OPTIONS"" --disable-gpu --start-maximized --incognito "$SERVER"gamesedu/lightbot_haan/index.html?map=""$@"" "
return 5	
}

lightbot_chrome_browser() {
# NOTE : ONLY foir custom MAPS. for normal just run : . iron_flash_puppy_pepper_home.sh "--incognito "$SERVER"gamesedu/lightbot_haan/
# eg  lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito "$SERVER"gamesedu/lightbot_haan/index.php?map=""$1"
. google-chrome-stable-puppy-home.sh "$CHROME_OPTIONS"" --disable-gpu --start-maximized --incognito "$SERVER"gamesedu/lightbot_haan/index.html?map=""$@"" "
return 5  
}

firefox10() {
#. firefox10-puppy-home.sh "$1"
#eg firefox10 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
su -l puppy -c '/opt/firefox10/firefox -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/firefox10" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
return 5
}

firefox24() {
pkill -f firefox
pkill -f firefox24
#. firefox24-puppy-home.sh "$1"
#eg firefox24 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
#su -l puppy -c '/opt/firefox24/firefox -private -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/firefox24" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
firefox24-puppy-home-many-tabs.sh $1 $2 $3 $4
return 5
}  

palemoon() {
	#palemoon doesn't work ....
pkill -f palemoon
#pkill -f firefox24
#. firefox24-puppy-home.sh "$1"
#eg firefox24 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
mkdir -p /mnt/home/downloads_linux/.data/palemoon
mkdir -p /mnt/home/downloads_linux/.cache/palemoon
xhost +local:puppy
sudo -u puppy palemoon '-private -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/palemoon" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
#su -l puppy -c 'palemoon -private -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/palemoon" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
#firefox24-puppy-home-many-tabs.sh $1 $2 $3 $4
return 5
}  


create_download_linux_home_folders(){
xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/$1
mkdir -p /mnt/home/downloads_linux/.cache/$1
#chown -R puppy:puppy /mnt/home/downloads_linux/.data
#chown -R puppy:puppy /mnt/home/downloads_linux/.cache
cp -n /usr/bin/firefox24_default_home_prefs.js /mnt/home/downloads_linux/.data/$1/prefs.js
}

probe_the_server()
{
	#every 2 minutes gets the file /uploads/john_exec_cmd_on_client.sh and executes it
	# you should call it with probe_the_server &  (to run in background) 
	cd /tmp
	while /bin/true; do
		cd /tmp
	    rm /tmp/john_exec_cmd_on_client.sh
		wget ""$SWFlocal"john_exec_cmd_on_client.sh" --directory-prefix=/tmp/
		chmod a+x /tmp/john_exec_cmd_on_client.sh
		. /tmp/john_exec_cmd_on_client.sh
	    #something_in_the_background
	    sleep 2m # Waits 2 minutes.
	done &
	return 5
}

# 200916b - Check Olohmero (used to check if oloimero hour has started - Combine it with a DAYOFWEEK check)
check_oloimero_time()
{
    currTime=`date +%k%M`
    tempTime=$1
    #if [ $tempTime -gt 200 -a $tempTime -lt 2200 ]; then 
    if [ $currTime -gt $tempTime ]; then 
        echo "OKpassedCheck"
        exit 1
    else
        echo "Time is after 10 PM and before 2 AM. Running normally."
        exit 2
    fi
}


#
#function repeat next command N times (eg repeat 10 echo "hello"  - repeates 10 times)
repeat() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

################  TEST COMMANDS #############
probe_the_server &

#ironstartincognito ""$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
leafpad "Week number: $WEEKNUMBER 2021-22" &

##########parallel
#ironstart ""$SWFlocal"swf_giortes/index_halloween.html?timer3" &
#. /usr/local/bin/tuxpaint-with-conf.sh &
#wait
#repeat 2 palemoon ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3&showdiv4&showdiv5 https://---studio.code.org/s/course1/stage/5/puzzle/1 "$SWFlocal"pack_A06.html?probeserver\&norightclick\&timer4"
#repeat 2 palemoon-puppy.sh ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3&showdiv4&showdiv5 https://---studio.code.org/s/course1/stage/5/puzzle/1 "$SWFlocal"pack_A06.html?probeserver\&norightclick\&timer4"

################# END OF TEST COMMANDS ##########



############## OLOHMERO START #####################
#--------------- SPECIAL EVENTS --------------------------
#TEMP john_extra_apps.sh loads extra apps for the current day
load_extra_apps &


if [ "$(check_oloimero_time 1302)" == 'OKpassedCheck' ]
then
leafpad "run ΟΛΟΗΜΕΡΟ EVERYDAY 13:05" &

#ironstartincognito.sh ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SERVER"swf/fun/treasure_of_cutlass_reef-__pirate-ship-battle__NoNavUrl!!!.swf"
repeat 4 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?probeserver http://OLOHMERO "
repeat 4 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "
repeat 2 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
#ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"

fi





# 200916b - Check Olohmero 
if [ $DAYOFWEEK == 'Δευτέρα' ] || [ $DAYOFWEEK == 'Monday' ]
then
echo "Δευτέρα"

fi

if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
then
echo "Τρίτη"
fi


if [ $DAYOFWEEK == 'Δευτέρα' ] || [ $DAYOFWEEK == 'Monday' ]
then
echo "Δευτέρα OLOHMERO"
if [ "$(check_oloimero_time 1302)" == 'OKpassedCheck' ]
then
leafpad "run ΟΛΟΗΜΕΡΟ Δευτέρα 13:05" &

#ironstartincognito.sh ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SERVER"swf/fun/treasure_of_cutlass_reef-__pirate-ship-battle__NoNavUrl!!!.swf"
repeat 4 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "
repeat 2 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
#ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"

fi
# ΤΡΙΤΗ'
fi

if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
then
echo "Τρίτη OLOHMERO  A2 tmima"
if [ "$(check_oloimero_time 1302)" == 'OKpassedCheck' ]
then
leafpad "run ΟΛΟΗΜΕΡΟ Τρίτη 13:05  A2 tmima" &
#ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
repeat 4 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "

repeat 3 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"

#ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"

ironstartincognito ""$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy "$SERVER"swf/ferryhalim.com.html?timer2\&probeserver"
#ironstartincognito.sh ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SERVER"swf/fun/treasure_of_cutlass_reef-__pirate-ship-battle__NoNavUrl!!!.swf"
ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO"
fi
# ΤΡΙΤΗ'
fi

if [ $DAYOFWEEK == 'Τετάρτη' ] || [ $DAYOFWEEK == 'Wednesday' ]
then
echo "Τετάρτη"

if [ "$(check_oloimero_time 1302)" == 'OKpassedCheck' ]
then
leafpad "run ΟΛΟΗΜΕΡΟ Τετάρτη 13:05  tmima 9" &
#ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
repeat 4 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "

repeat 3 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
fi

fi

if [ $DAYOFWEEK == 'Πέμπτη' ] || [ $DAYOFWEEK == 'Thursday' ]
then
echo "Πέμπτη"
if [ "$(check_oloimero_time 1302)" == 'OKpassedCheck' ]
then
leafpad "run ΟΛΟΗΜΕΡΟ Πέμπτη 13:05 tmima10 " &
repeat 4 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "

#ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
repeat 3 ironstartincognito ""$SERVER"swf/ferryhalim.com.html?timer2\&probeserver http://OLOHMERO "$SWFlocal"pack_url_param.html?url1=ab/coloring/coloring-inside-out__noADsURL.swf\&url2=http://weavesilk.com\&url3=graphics_/drip_paint_jacksonpollock_by_miltos_manetas.swf\&url4=ab/coloring/coloring_book_yippy_yahoo__3img_NoNav.swf\&url5=_____________________\&url6=Olohmero A-dimotikoy"
fi

fi

if [ $DAYOFWEEK == 'Παρασκευή' ] || [ $DAYOFWEEK == 'Friday' ]
then
echo "Παρασκευή"
fi



##############OLOHMERO END################




##################  FULL WEEK EVENTS #################################
# Προγραμματισμός εβδομάδων    date +%V    WEEKNUMBER=17 #TEST :
# WEEKNUMBER=17 #TEST



adjustWeekFinalNum_for_week $EASTER_PREWEEK_01
if [ $WEEKNUMBER == $EASTER_PREWEEK_01 ] || [ "$WEEKNUMBER" == 'Easter pt A' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK easter ptA    activated --- Week number: $WEEKNUMBER" &
repeat 6 ironstartincognito ""$SWFlocal"ramkid_giortes_pasxa_pt1.html?probeserver "$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html"
#ironstartincognito ""$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
ironstartincognito ""$SWFlocal"ramkidpedia_vol20_pasxa1.html?probeserver "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
fi
adjustWeekFinalNum_for_week $EASTER_PREWEEK_02
if [ $WEEKNUMBER == $EASTER_PREWEEK_02 ] || [ "$WEEKNUMBER" == 'Easter pt B' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK easter ptB    activated --- Week number: $WEEKNUMBER" &
#ironstartincognito ""$SWFgiortes"index_easter.html?probeserver\&norightclick\&timer3 https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&file=giorti_pasxa01"
repeat 6 ironstartincognito ""$SWFgiortes"index_easter.html?probeserver\&norightclick\&timer3 https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&showsubmit\&nocopy\&file=giorti_pasxa01"


fi

adjustWeekFinalNum_for_week $RECYCLE_DAY
if [ $WEEKNUMBER == $RECYCLE_DAY ] || [ "$WEEKNUMBER" == 'Recycle - Earth Days' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK Recycle Day    activated --- Week number: $WEEKNUMBER" &
repeat 7 ironstartincognito ""$SWFlocal"pack_recycle.html?probeserver\&norightclick\&timer3 https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&showsubmit\&nocopy"
#ironstartincognito ""$SWFlocal"pack_recycle.html?probeserver\&norightclick\&timer3 https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy"

fi  

adjustWeekFinalNum_for_week $OCT28_PREWEEK
if [ $WEEKNUMBER == $OCT28_PREWEEK ] || [ "$WEEKNUMBER" == '28 October pre week' ]
then
# NOTE  : 28 oct pre-week is usually week 43 or 42 - we swap these weeks with maze part 2 we should put Park 1 in the cut down week after oct28

#--------------------- this is for Full week-all classes events 
leafpad "WEEK 28 october pre week     activated --- Week number: $WEEKNUMBER" &
# (+ 28october pre week   
repeat 6  ironstartincognito ""$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy\&file=giorti28oct01 "$SWFlocal"pack_paint1.html?timer3\&probeserver"
#ironstartincognito ""$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&nocopy\&hidediv1\&file=giorti28oct01 "$SWFlocal"pack_paint1.html?timer3\&probeserver"

fi

adjustWeekFinalNum_for_week $OCTOBER28
if [ $WEEKNUMBER == $OCTOBER28 ] || [ "$WEEKNUMBER" == '28 October week(argia 26,28 + giortes) ' ]
then
# NOTE  : 28 oct pre-week is usually week 43 or 42 - we swap these weeks with maze part 2 we should put Park 1 in the cut down week after oct28

#--------------------- this is for Full week-all classes events 
leafpad "WEEK giorti 28 October week(argia 26,28 + giortes) activated --- Week number: $WEEKNUMBER" &
# (+ 28october pre week   
repeat 6  ironstartincognito ""$SWFlocal"pack_parking1.html?probeserver\&norightclick  "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy\&hidediv1\&file=giorti28oct01 "$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick 28October-HalloweenDraw"
repeat 6  ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/spongebob-parking_jon04noURLS_need760MBram_!!.swf\&url2=fun/puzzle_board/edsparkinggame.swf\&url3=type/typing_bricks\(puzzle\)!!!.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=fun/puzzle_board/spark_chess_17521__allows_save_NoNavUrl.swf\&url6=park-1\&probeserver\&norightclick  "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&nocopy\&hidediv1\&file=giorti28oct01 "$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick 28October-HalloweenDraw"
#ironstartincognito ""$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&nocopy\&hidediv1\&file=giorti28oct01 "$SWFlocal"pack_paint1.html?timer3\&probeserver"

fi





################## END OF FULL WEEK EVENTS #################################




#201902118-22  , 2020 updated
#adjustWeekFinalNum_for_week 7
if [ $WEEKNUMBER == $APOKRIES_PREWEEK_01 ] || [ "$WEEKNUMBER" == 'Halloween pt1' ]
then
#--------------------- this is for Full week-all classes events    
leafpad "WEEK halloween ptA (ramkid_invitation_party , swf_ramkid_cds2k5/Ramkid_12feb_apokries , KidsPedia/kids_ePedia32cd/Volume13 )   activated --- Week number: $WEEKNUMBER" &
#ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html "$SERVER"tinymce_class/tinymce.html?probeserver\&nocopy\&file=giorti_apokries01"
repeat 6 ironstartincognito ""$SERVER"swf/ramkidpedia_vol13_apokries1.html?probeserver "$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html "$SERVER"tinymce_class/tinymce.html?probeserver\&nocopy\&showsubmit\&file=giorti_apokries01 "
fi

#200217 updated  (NoteSTARTWEEKCOUNT +08 NOT working error)
#adjustWeekFinalNum_for_week 8
if  [ "$WEEKNUMBER" == $APOKRIES_PREWEEK_02 ] #||  [ "$WEEKNUMBER" == '09' ] 
#|| [ $WEEKNUMBER == "0"$WEEKFINALNUM adjustWeekFinalNum_for_week '08')) ] || [ $WEEKNUMBER == "0"$WEEKFINALNUM adjustWeekFinalNum_for_week '09')) ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK halloween ptB (for 2 weeks  games)   activated --- Week number: $WEEKNUMBER    20190225-08" &
#ironstartincognito "http://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&file=giorti_apokries01 "$SWFgiortes"index_halloween.html?probeserver\&norightclick\&timer3"
repeat 6 ironstartincognito $SWFgiortes"index_halloween.html?probeserver\&norightclick\&timer3 ""http://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&showsubmit\&file=giorti_apokries01 "
#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3 http://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&file=giorti_apokries01"
repeat 4 ironstartincognito ""$SWFgiortes"index_halloween.html http://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&file=giorti_apokries01\&showsubmit\&hidediv1"

fi

######################################################################################
#############  ALL WEEKS START #######################################################
######################################################################################
adjustWeekFinalNum_for_week 38
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == '37' ] || [ "$WEEKNUMBER" == 'wk01-02-SepB-C' ]  
then
# ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"pack_A03.html?probeserver\&norightclick 
#"$SWFlocal"funbrain.html?timer3  http://first_week_enter_ONOMATA_PC03_E2_Giorgos_giannis"

repeat 6 ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"pack_A07.html?probeserver\&norightclick 
"$SWFlocal"funbrain.html?timer3\&probeserver  http://first_week_enter_ONOMATA_PC03_E2_Giorgos_giannis"

repeat 6 ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"pack_A03.html?probeserver\&norightclick 
"$SWFlocal"funbrain.html?timer3  http://first_week_enter_ONOMATA_PC03_E2_Giorgos_giannis"

ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"pack_A03.html?probeserver\&norightclick 
"$SWFlocal"funbrain.html?timer3  http://first_week"


$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/ALL_biografiko_mathiti.doc" &

ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
#ironstart ""$SERVER"tinymce_class/tinymce_submit.html" ""$SWFlocal"funbrain.html?timer3"
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/ALL_biografiko_mathiti.doc" &
ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/ALL_biografiko_mathiti.doc" &

ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"




ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
ironstart ""$SWFlocal"funbrain.html?timer3"
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/ALL_biografiko_mathiti.doc" &
ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
ironstart ""$SWFlocal"funbrain.html" ""$SERVER"tinymce_class/tinymce_submit.html" 
ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html "$SWFlocal"funbrain.html?timer3 "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/ALL_biografiko_mathiti.doc" &

fi

adjustWeekFinalNum_for_week 39
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk03-SepD' ]  
then


repeat 7 ironstartincognito ""$SWFlocal"pack_typing1.html?probeserver&norightclick&timer3 """$SERVER"tinymce_class/tinymce_submit.html?showsubmit "$SWFlocal"funbrain.html?probeserver\&timer3  "
#repeat 7 ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3 """$SERVER"tinymce_class/tinymce_submit.html?showsubmit "$SWFlocal"funbrain.html?probeserver\&timer3  "
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3 """$SERVER"tinymce_class/tinymce_submit.html?showsubmit "$SWFlocal"funbrain.html?probeserver\&timer3  "


repeat 6 ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit "$SWFlocal"funbrain.html?probeserver\&timer3  "$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1\&timer3"


#a-b
ironstartincognito ""$SWFlocal"pack_type_ramkid_greek.html"
#c-st
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=type/excuses-excuses__type_noADsURL.swf\&url6=typing-2\&timer3"

ironstartincognito ""$SWFlocal"pack_type_ramkid_greek.html"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=type/excuses-excuses__type_noADsURL.swf\&url6=typing-2\&timer3"
ironstartincognito ""$SWFlocal"pack_type_ramkid_greek.html"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=type/excuses-excuses__type_noADsURL.swf\&url6=typing-2\&timer3"
ironstartincognito ""$SWFlocal"pack_type_ramkid_greek.html"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=type/excuses-excuses__type_noADsURL.swf\&url6=typing-2\&timer3"

fi


############ OCTOBER ###################

adjustWeekFinalNum_for_week 40
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk04--OCtA' ]  
then

# eduactiv8 Lesson1 : A-B Γλωσσικές Τέχνες->Ανακαλύψτε τα γραμματα
#. /opt/eduActiv8/eduActiv8 &
##/opt/eduActiv8/eduActiv8 &
sudo -u puppy bash -c "/opt/eduActiv8/eduActiv8 &";
#ironstartincognito ""$SWFlocal"pack_type_ramkid_greek.html"
repeat 7 ironstartincognito ""$SWFlocal"pack_typing2.html?probeserver&norightclick&timer3 """$SWFlocal"funbrain.html?probeserver\&timer3  "
repeat 6 ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=type/horse-racing-typing__rapidtyping.com_NoNavUrl.swf\&url6=typing-2\&probeserver\&timer3 "$SWFlocal"funbrain.html?norightclick";
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=type/horse-racing-typing__rapidtyping.com_NoNavUrl.swf\&url6=typing-2\&probeserver\&timer3"
#ironstartincognito ""$SWFlocal"pack_type_ramkid_greek.html"
#. /opt/eduActiv8/eduActiv8 &
sudo -u puppy bash -c "/opt/eduActiv8/eduActiv8 &";
#/opt/eduActiv8/eduActiv8



fi

adjustWeekFinalNum_for_week 41
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk05-OctB' ]  
then


repeat 6 ironstartincognito ""$SWFlocal"pack_maze1.html?probeserver\&timer3"

repeat 6 ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url2=fun/maze/the-maze-game\(robot\)__no_jp_utl.swf\&url3=ab/ladybugs_TRODLER_noADsURL@.swf\&url4=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url5=fun/td/BloonsTowerDefense2_ok4slow_p4_NoNavUrl.swf\&url6=maze-1\&probeserver\&timer3"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url2=fun/maze/the-maze-game\(robot\)__no_jp_utl.swf\&url3=ab/ladybugs_TRODLER_noADsURL@.swf\&url4=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url5=fun/td/BloonsTowerDefense2_ok4slow_p4_NoNavUrl.swf\&url6=maze-1\&probeserver\&timer3"

fi

adjustWeekFinalNum_for_week 42
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk06-OctC' ]  
then
# Week42 this is exchanged with the Oct28 Pre-Week (wweks 42,43,44 are overwritten from the 2 oct28 weeks -the remaining will be Maze2)
repeat 6 ironstartincognito ""$SWFlocal"pack_maze2.html?probeserver\&timer2"

repeat 6  ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/labrat__maze-kids_needFastPC_unencr2noAdsURL_cheat_GR01_!!.swf\&url2=fun/maze/minotaur_122_maze__unencr3_noAdsUrl_!.swf\&url3=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url4=ab/ladybugs_TRODLER_noADsURL@.swf\&url5=fun/physics/soccer-balls__physics__noADurl.swf\&url6=maze-2\&probeserver\&timer3"

fi

adjustWeekFinalNum_for_week 43
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk07-OctD' ]  
then

# Week42 this is exchanged with the Oct28 Pre-Week (wweks 42,43,44 are overwritten from the 2 oct28 weeks -the remaining will be Maze2)
repeat 6 ironstartincognito ""$SWFlocal"pack_maze2.html?probeserver\&timer2"
repeat 6  ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/labrat__maze-kids_needFastPC_unencr2noAdsURL_cheat_GR01_!!.swf\&url2=fun/maze/minotaur_122_maze__unencr3_noAdsUrl_!.swf\&url3=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url4=ab/ladybugs_TRODLER_noADsURL@.swf\&url5=fun/physics/soccer-balls__physics__noADurl.swf\&url6=maze-2\&probeserver\&timer3"


#28oct A-B draw jspaint , C-ST write word
repeat 6  ironstartincognito ""$SWFlocal"pack_giortes28oct.html "$SERVER"tinymce_class/tinymce.html?probeserver\&showsubmit\&file=giorti28oct01 "$SERVER"jspaint/index.html#load:"$SERVER"jspaint/school/28oct-01.png"
#ironstartincognito ""$SWFlocal"pack_giortes28oct.html "$SERVER"tinymce_class/tinymce.html?probeserver\&file=giorti28oct01 "$SERVER"jspaint/index.html#load:"$SERVER"jspaint/school/28oct-01.png"

. /usr/local/bin/tuxpaint-with-conf.sh &


$OOOKIDS$OOOKIDSpathprefix"AskiseisWord/Για Πληκτρολόγηση.doc"
ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=giorti28oct01" &
 #ironstartincognito "https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&file=giorti28oct01" &
$OOOKIDS$OOOKIDSpathprefix"AskiseisWord/Για Πληκτρολόγηση.doc"
ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=giorti28oct01" &
#ironstartincognito "https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&file=giorti28oct01" &
$OOOKIDS$OOOKIDSpathprefix"AskiseisWord/Για Πληκτρολόγηση.doc"
ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=giorti28oct01" &
$OOOKIDS$OOOKIDSpathprefix"AskiseisWord/Για Πληκτρολόγηση.doc"
ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=giorti28oct01" &


#___ alt online ___https://plirof.github.io/tinymce_class/tinymce.html?probeserver&file=giorti28oct01


fi

adjustWeekFinalNum_for_week 44
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk08-OctE-NovA' ]  
then

# Week42 this is exchanged with the Oct28 Pre-Week (wweks 42,43,44 are overwritten from the 2 oct28 weeks -the remaining will be Maze2)
repeat 6  ironstartincognito ""$SWFlocal"pack_maze2.html?probeserver\&timer3"

repeat 6  ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/labrat__maze-kids_needFastPC_unencr2noAdsURL_cheat_GR01_!!.swf\&url2=fun/maze/minotaur_122_maze__unencr3_noAdsUrl_!.swf\&url3=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url4=ab/ladybugs_TRODLER_noADsURL@.swf\&url5=fun/physics/soccer-balls__physics__noADurl.swf\&url6=maze-2\&probeserver\&timer3"


#Halloween + 28october part B (συνήθως μισές τάξεις λόγω αργιών) 
# HALLOWEEN 2019 (+ 28october part2) octomber 31   - DRAW SCARY STUFF# tuxpaint πινέλα  (ζωγραφίστε σπίτι + αμάξι ,πινέλα ,σφραγίδες) ,typing_bricks(puzzle)!!!.swf
repeat 6  ironstartincognito ""$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&nocopy\&showsubmit\&hidediv1\&file=giorti28oct01 "$SWFlocal"pack_paint1.html?timer3\&probeserver"
#ironstartincognito ""$SWFlocal"pack_giortes28oct.html?probeserver\&norightclick "$SERVER"tinymce_class/tinymce_submit.html?probeserver\&nocopy\&hidediv1\&file=giorti28oct01 "$SWFlocal"pack_paint1.html?timer3\&probeserver"


# HALLOWEEN 2019 octomber 31   - DRAW SCARY STUFF
# tuxpaint πινέλα  (ζωγραφίστε σπίτι + αμάξι ,πινέλα ,σφραγίδες) ,typing_bricks(puzzle)!!!.swf
. /usr/local/bin/tuxpaint-with-conf.sh &
ironstartincognito ""$SWFlocal"pack_paint1.html?timer3\&probeserver"


fi
########### NOVEMBER ###################

adjustWeekFinalNum_for_week 45
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk09-NovA2' ]  
then
# code.org :AB: (1. Χαρούμενοι Χάρτες , 2. Κούνισέ το, Κούνισέ το , 3. Παζλ: Μάθε την μεταφορά και )	
# code.org : E-ST  4. Λαβύρινθος angry-birds: Ακολουθία
repeat 7 googlehomestartincognito ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3 https://AB-1.01,E-ST1.4---studio.code.org/s/course1/stage/3/puzzle/1 "$SWFlocal"pack_A06.html?norightclick&probeserver "$SWFlocal"pack_paint1_ruffle.html?timer3&norightclick&probeserver"

repeat 7 ironstart ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3 https://---studio.code.org/s/course1/stage/3/puzzle/1 "$SWFlocal"pack_A06.html?norightclick\&probeserver "$SWFlocal"pack_paint1.html?timer3\&norightclick\&probeserver"

repeat 6  ironstart "https://studio.code.org/s/course1/stage/3/puzzle/1 "$SWFlocal"pack_A06.html?norightclick\&probeserver"
#ironstart "https://studio.code.org/s/course1/stage/3/puzzle/1 "$SWFlocal"pack_A06.html?norightclick\&probeserver"

fi

adjustWeekFinalNum_for_week 46
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk10-NovB' ]  
then
# A-B
# gcompris 15 :mouse _ψαρια - keyboard ζαρι (τα κουμπιά τους φανηκαν δυσκολα)
gcompris &
# E-ST  7. melisses Ακολουθία 
repeat 7  googlehomestartincognito ""$SWFlocal"pack_codeorg1.html "$SWFlocal"pack_codeorg2.html https://ABgcompris__E-ST-c1.13---studio.code.org/s/course1/stage/4/puzzle/1 "$SWFlocal"pack_A06.html?probeserver&norightclick"

repeat 7  ironstart ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3&showdiv4 https://---studio.code.org/s/course1/stage/4/puzzle/1 "$SWFlocal"pack_A06.html?probeserver\&norightclick"


fi

adjustWeekFinalNum_for_week 47
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk11-NovC' ]  
then
#A-B  pack_A06 spider , eat flies, tomato
gcompris &
# E-ST   13. Λαβύρινθο angry-birds: ΕΠΑΝΑΛΗΨΕΙΣ 
repeat 7 googlehomestartincognito ""$SWFlocal"pack_codeorg1.html?probeserver "$SWFlocal"pack_codeorg_playlab.html "$SWFlocal"pack_codeorg2.html https://ABGDgcompris_E-ST-13---studio.code.org/s/course1/stage/5/puzzle/11 "$SWFlocal"pack_A07_ruffle.html?probeserver&norightclick&timer3"
#repeat 7 googlehomestartincognito ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3&showdiv4&showdiv5 "$SWFlocal"pack_codeorg2.html https://---studio.code.org/s/course1/stage/5/puzzle/1 "$SWFlocal"pack_A07_ruffle.html?probeserver&norightclick&timer3"

repeat 7 ironstart ""$SWFlocal"pack_codeorg1.html?showdiv1&showdiv2&showdiv3&showdiv4&showdiv5 https://ABgcomprisC__E-ST-14mellises-epanalipsi---studio.code.org/s/course1/stage/5/puzzle/1 "$SWFlocal"pack_A06.html?probeserver\&norightclick\&timer4"
#ironstart "https://studio.code.org/s/course1/stage/5/puzzle/1 "$SWFlocal"pack_A06.html?probeserver\&norightclick\&timer4"

fi

adjustWeekFinalNum_for_week 48
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk12-NovD' ]  
then
# eduactiv8 Lesson2 : A-B Σχηματισμός Λέξεων-> ζώα , δουλείες ,ρούχα)
#sudo -u puppy bash -c "/opt/eduActiv8/eduActiv8 &";
gcompris &
##/opt/eduActiv8/eduActiv8 &
#repeat 7 ironstart ""$SWFlocal"pack_codeorg1.html https://---studio.code.org/s/course1/stage/7/puzzle/1 "$SWFlocal"pack_A03.html?probeserver\&norightclick"
# used new pack_code org (replaces href with button for greek)
# E-ST   14. Melissa: ΕΠΑΝΑΛΗΨΕΙΣ ,Playlab
#week48: A-B-G:GcomprisC , D,E,ST :codeorg1.14+1.16 (melisses repeat,playlabDog)
repeat 7 googlehomestartincognito ""$SWFlocal"pack_codeorg1.html "$SWFlocal"pack_codeorg_playlab.html  https://ABC_gcompr_D_E-ST-1.14-playlab(dog)---studio.code.org/s/course1/stage/7/puzzle/1 "$SWFlocal"pack_A04_ruffle.html?probeserver&norightclick"

repeat 7 ironstartincognito ""$SWFlocal"pack_codeorg1.html https://---studio.code.org/s/course1/stage/7/puzzle/1 "$SWFlocal"pack_A03.html?probeserver\&norightclick"

#ironstart "https://studio.code.org/s/course1/stage/7/puzzle/1 "$SWFlocal"pack_A03.html?probeserver\&norightclick"

fi

########### DECEMBER ###################
adjustWeekFinalNum_for_week 49
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk13-DecA' ]  
then

# Xristougenniatikes drasthriothtes (oles oi takseis) , christmas hidden objects , ζωγραφιστε χριστουγ κάρτες ramkid
# ???  giortes xmas Α !!!!! NA ΦΤΙΑΞΩ το ramkid_giortes_xmas_pt1.html

#ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy\&file=xmas_rudolf"" "$SWFlocal"ramkidpedia_vol04_xmas1.html "$SWFlocal"ramkid_giortes_xmas_pt1.html"
repeat 7 ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy&hidediv4\&file=xmas_rudolf"" "$SWFlocal"ramkidpedia_vol04_xmas1.html "$SWFlocal"ramkid_giortes_xmas_pt1.html"

#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/xmas-rountolf-typing.doc" &
cd "/tmp/";wget --directory-prefix="/tmp/" -O "a" ""$SERVER"askiseis_office/OFFICE_extra_files/xmas-rountolf-typing.doc"; ooo4kids1.3 -n /tmp/a &
ironstartincognito ""$SWFlocal"ramkidpedia_vol04_xmas1.html "$SWFlocal"ramkid_giortes_xmas_pt1.html"

repeat 3 ironstartincognito ""$SWFgiortes"index_xmas.html?probeserver\&norightclick\&timer3"

fi

# XMAS_PREWEEK_01 Christmas PREWEEK_01 - two weeks before christmas
adjustWeekFinalNum_for_week 50
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk14-DecB' ]  
then

# giortes xmas Β : 2-3 μαθήματα (μετά τέλος ασκήσεων)
repeat 7 ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy\&file=xmas_rudolf&hidediv1&hidediv2"" "$SWFgiortes"index_xmas.html?probeserver\&norightclick\&timer3"
#ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?probeserver\&showsubmit\&nocopy\&file=xmas_rudolf"" "$SWFgiortes"index_xmas.html?probeserver\&norightclick\&timer3"


#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/xmas-rountolf-typing.doc" &	
#cd "/tmp/";wget --directory-prefix="/tmp/" -O "a" ""$SERVER"askiseis_office/OFFICE_extra_files/xmas-rountolf-typing.doc"; ooo4kids1.3 -n /tmp/a &
#repeat 6  ironstartincognito ""$SWFgiortes"index_xmas.html?probeserver\&timer3"
#repeat 6  cd "/tmp/";wget --directory-prefix="/tmp/" -O "a" ""$SERVER"askiseis_office/OFFICE_extra_files/xmas-rountolf-typing.doc"; ooo4kids1.3 -n /tmp/a
#ironstartincognito ""$SWFgiortes"index_xmas.html?probeserver\&timer3"
#cd "/tmp/";wget --directory-prefix="/tmp/" -O "a" ""$SERVER"askiseis_office/OFFICE_extra_files/xmas-rountolf-typing.doc"; ooo4kids1.3 -n /tmp/a
fi

# XMAS_PREWEEK_02 - Last week before Christmas
adjustWeekFinalNum_for_week 51
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk15-DecC' ]  
then

# giortes xmas Β : 2-3 μαθήματα (μετά τέλος ασκήσεων)
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/xmas-rountolf-typing.doc" &		
#cd "/tmp/";wget --directory-prefix="/tmp/" -O "a" ""$SERVER"askiseis_office/OFFICE_extra_files/xmas-rountolf-typing.doc"; ooo4kids1.3 -n /tmp/a

repeat 7 ironstartincognito ""$SWFgiortes"index_xmas.html?probeserver\&norightclick" ""$SWFgiortes"xmas_santatracker.html?probeserver\&norightclick"
#ironstartincognito ""$SWFgiortes"index_xmas.html?probeserver\&norightclick\&timer2"
fi

adjustWeekFinalNum_for_week 52
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk---DecD' ]  
then
	repeat 7 ironstartincognito ""$SWFgiortes"index_xmas.html?probeserver&norightclick" ""$SWFgiortes"xmas_santatracker.html?probeserver&norightclick"
	leafpad "CLOSED XMAS WEEK activated --- Week number: $WEEKNUMBER"

fi


########### JANUARY ###################
adjustWeekFinalNum_for_week 1
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk---NovA2' ]  
then

	leafpad "CLOSED XMAS WEEK activated --- Week number: $WEEKNUMBER"

fi

############  ********************
# NOTE first 9 weeks (o..9) have problem Cause of the starting 0  : 02==2  , 03==3
############  ********************
adjustWeekFinalNum_for_week 2
if [ $WEEKNUMBER ==  $WEEKFINALNUM  ]   || [ "$WEEKNUMBER" == 'wk16-JanB' ]  
then

#tuxpaint   ,  15o tuxpaint : βασιλόπιτα, Κάρτα με ευχές Νέα χρονιά
/usr/local/bin/tuxpaint-with-conf.sh &
repeat 7 ironstartincognito ""$SWFlocal"pack_paint1.html?timer3\&norightclick\&probeserver"
#ironstartincognito ""$SWFlocal"pack_paint1.html?timer3\&norightclick\&probeserver"

fi

adjustWeekFinalNum_for_week 3
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk17-JanC' ]  
then
# A-B 
gcompris &
#E-ST

repeat 7  ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&nocopy\&showsubmit\&file=month_jan"" "$SWFlocal"pack_paint1.html?timer3\&norightclick\&probeserver"
#repeat 6  ironstartincognito "https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&file=month_jan"" ZZZZZ "$SWFlocal"pack_paint1.html?timer3\&norightclick\&probeserver"
#ironstartincognito "https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&nocopy\&file=month_jan"" "$SWFlocal"pack_paint1.html?timer3\&norightclick\&probeserver"


ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=month_jan"" "$SWFlocal"pack_paint1.html?timer3\&probeserver"
ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=month_jan"   

repeat 6  $OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.2_antigrafi_didaktiko_yliko.doc"
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.2_antigrafi_didaktiko_yliko.doc"
fi

adjustWeekFinalNum_for_week 4
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk18-JanD' ]  
then

#250120: A-B: http://192.168.1.200/swf/pack_A01.html?norightclick&probeserver , _D-ST: pt1 : A)simple basicKIDS ZX v01 page01to05 3min56sec audio8 : https://www.youtube.com/embed/XUqwkJ_I2x4 ,B) HTM2BAS οδηγίες https://www.youtube.com/embed/g1YVRLXFmh8 , C) basic page 6-8 https://www.youtube.com/embed/EFLcaLgmApE

# A-B 
repeat 6  ironstartincognito ""$SWFlocal"pack_A01.html?norightclick\&probeserver "$SWFlocal"pack_paint1.html?norightclick\&probeserver "$SERVER"zx/zx_htm2tap/ A-ΓpackA1, D-ST_BAS_page1-5,htm2tap_odhgies,BASpage6-8"
#ironstartincognito ""$SWFlocal"pack_A01.html?norightclick\&probeserver "$SWFlocal"pack_A02.html?norightclick\&probeserver"

#repeat 6  $OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc" &
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#ironstartincognito ""$SWFlocal"pack_A01.html?norightclick\&probeserver "$SWFlocal"pack_A02.html?norightclick\&probeserver" &
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"

fi

adjustWeekFinalNum_for_week 5
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk19-JanE' ]  
then
#C-E   code1 intro ευκολο για μεγάλες τάξεις (ας παίξουν pack_A04 όσοι τελειώσουν)
#ΣΤ : htm2tap pt2 (για συνέχεια) page 10 PRINT (violets)  : https://www.youtube.com/embed/PmmBmN8vwlU , page 12 (rocket) PRINT: https://www.youtube.com/embed/78wvG8HGpOw
repeat 6  lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt "$SWFlocal"pack_A04.html?norightclick\&probeserver "$SERVER"zx/zx_htm2tap/"
#lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt "$SWFlocal"pack_A04.html?norightclick\&probeserver"

fi

########### FEBRUARY ###################
adjustWeekFinalNum_for_week 6
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk20-FebA' ]  
then
#C-ST  code2 Δ,Ε ΕΠΑΠΑΝΑΛΑΒΕ
#ΣΤ: zx_htm2tap pt3 : A4)SimpleBasicGR page13 PRINT (praxeis) 2m00s orig https://www.youtube.com/watch?v=t4UeyP7kA7E , B1) p14 LET1+ΜΕΤΑΒΛΗΤΕΣnumbers 2m02s vol8 https://www.youtube.com/watch?v=MYmbGcE4P5Q
repeat 6  lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html?norightclick\&probeserver "$SERVER"zx/zx_htm2tap/"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html?norightclick\&probeserver"

fi

adjustWeekFinalNum_for_week 7
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk21-FebB' ]  
then
echo "empty line"
# APOKRIES 2020
tuxmath &
#ΣΤ: zx_htm2tap pt5: B1)p14 https://www.youtube.com/watch?v=MYmbGcE4P5Q binteo mono (gia epanalipsi LET). B2)SimpleBasicGR p15 LET2string 2m38s vol8 https://www.youtube.com/embed/mpLc75YptQ8 
repeat 6 ironstartincognito ""$SWFlocal"pack_A02.html?norightclick\&probeserver "$SWFlocal"pack_A01.html?norightclick\&probeserver "$SWFlocal"pack_itch_gamedesign.html?probeserver  "$SERVER"zx/zx_htm2tap/"
fi

adjustWeekFinalNum_for_week 8
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk22-FebC' ]  
then
echo "empty line"
#(Same as week 10 -alternative to apokries)
# (pack_code_rover.html : ΠΕΡΙΕΧΕΙ : Rover_nasa ,Tiny-explorers,tortuga.patatakia.tk,TurtlePond,pack) 
repeat 6 ironstartincognito ""$SWFlocal"pack_code_rover.html?probeserver\&norightclick\&timer4  https://diversen.github.io/drum-machine-javascript/index.html"
repeat 6 googlehomestartincognito " "$SWFlocal"pack_itch_gamedesign.html?probeserver "$SERVER"zx/zx_htm2tap/"
# APOKRIES 2021
fi

adjustWeekFinalNum_for_week 9
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk23-FebD' ]  
then
# APOKRIES 2021

echo "empty line"
# open NEWER google chrome for Game_design programs
#repeat 6 google-chrome-stable-puppy-home.sh  --incognito --simulate-outdated-no-au='407466480500' --start-maximized http://192.168.1.200/swf/pack_itch_gamedesign.html
###repeat 6 google-chrome-stable-puppy-home.sh --incognito --start-maximized --simulate-outdated-no-au='407466480500' " "$SWFlocal"pack_itch_gamedesign.html?probeserver "
#leafpad googlehomestartincognito" "$SWFlocal"pack_itch_gamedesign.html?probeserver " &
#PROBLEM FUNCTION 
repeat 6 googlehomestartincognito " "$SWFlocal"pack_itch_gamedesign.html?probeserver "$SWFlocal"pack_A01.html?norightclick&probeserver "$SERVER"zx/zx_htm2tap/ "

fi

########### MARCH ###################
adjustWeekFinalNum_for_week 10
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk24-MarA' ]  
then
sudo -u puppy bash -c "/opt/eduActiv8/eduActiv8 &";
# (pack_code_rover.html : ΠΕΡΙΕΧΕΙ : Rover_nasa ,Tiny-explorers,tortuga.patatakia.tk,TurtlePond,pack) 
repeat 6 ironstartincognito ""$SWFlocal"pack_code_rover.html?probeserver\&norightclick\&timer4  https://diversen.github.io/drum-machine-javascript/index.html"
#ironstartincognito ""$SWFlocal"pack_code_rover.html?probeserver\&norightclick\&timer4  https://diversen.github.io/drum-machine-javascript/index.html"

fi

adjustWeekFinalNum_for_week 11
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk25-MarB' ]  
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK 11,12 GFX1 ptA, PTB   activated --- Week number: $WEEKNUMBER" &
. /usr/local/bin/tuxpaint-with-conf.sh & # tuxpaint pt4  classes A + B
#GFX1 youtube : https://www.youtube.com/embed/nObnRvKtp2s
repeat 7 ironstartincognito ""$SWFlocal"pack_gfx1.html?probeserver\&timer4 "
#ironstartincognito ""$SWFlocal"pack_gfx1.html?probeserver\&timer4"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf&probeserver"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf&probeserver"


fi

adjustWeekFinalNum_for_week 12
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk26-MarC' ]  
then

#March25
#ironstartincognito ""$SERVER"tinymce_class/tinymce.html?probeserver\&file=giorti25mart01" &
#___ alt online ___ironstartincognito "https://plirof.github.io/tinymce_class/tinymce.html?probeserver\&file=giorti25mart01" &

#--------------------- this is for Full week-all classes events 
leafpad "WEEK 11,12 GFX1 ptA, PTB   activated --- Week number: $WEEKNUMBER" &
repeat 6  ironstartincognito ""$SWFlocal"pack_giortes25March.html?probeserver\&norightclick "$SWFlocal"pack_gfx1.html?probeserver "$SERVER"tinymce_class/tinymce.html?probeserver\&showsubmit\&file=giorti25mart01 "
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf&probeserver"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf&probeserver"

fi

adjustWeekFinalNum_for_week 13
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk27-MarD' ]  
then
#--------------------- this is for Full week-all classes events 
# GFX2 Youtube garfield : https://www.youtube.com/watch?v=m4PnVjwLAOg
# GFX2 Youtube Stickman : https://www.youtube.com/watch?v=PPaXeVNLO00
leafpad "WEEK GFX2 ptA, PTB    activated --- Week number: $WEEKNUMBER" &

cat >> /tmp/ΟΔΗΓΙΕΣ.txt << EOF
Week number: $WEEKNUMBER
ΑΣΚΗΣΗ 1:
Α) ΒΑΛΤΕ ΤΟΝ GARFIELD
Β) ΒΑΛΤΕ ΕΝΑ ΣΚΥΛΟ
Γ) ΒΑΛΤΕ ΣΥΝΕΦΑΚΙ ΣΤΟΝ GARFIELD
Δ) ΓΡΑΨΤΕ (ΣΤΑ ΕΛΛΗΝΙΚΑ): "ΓΑΒ"
Ε) 2η ΕΙΚΌΝΑ
EOF
leafpad /tmp/ΟΔΗΓΙΕΣ.txt &

repeat 6  ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver "$SWFlocal"ab/netsmartkids.html?probeserver&norightclick"
#ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"

fi




########### APRIL ###################
adjustWeekFinalNum_for_week 14
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk28-MarE-AprA' ]  
then
echo "empty"
# EASTER 2020
#Copy of Week18
echo "empty"
leafpad "WEEK 18 GFX2 pt B (Aft-Easter  activated --- Week number: $WEEKNUMBER" &

# EASTER 2020
repeat 7 ironstartincognito ""$SWFlocal"pack_gfx2.html?probeserver "$SWFlocal"pack_A03.html?probeserver\&norightclick "$SERVER"gamesedu/stick2animator/ "$SERVER"zx/zx_htm2tap/" 

fi

adjustWeekFinalNum_for_week 15
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk29-AprB' ]  
then
#copy of week 19
leafpad "WEEK lightbot SWF, A-B:Funbrain,StickMan epanalipsi activated --- Week number: $WEEKNUMBER" &	
#__(pack_code_lightbotswf EXEI: lightbotswf,turtlepond,tortuga.patatak,tiny-explor,packA03	
repeat 6  ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?probeserver\&timer2 "$SWFlocal"funbrain.html?probeserver "$SERVER"gamesedu/stick2animator/"
#ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?probeserver\&timer2"
echo "empty"
# EASTER 2020
fi

adjustWeekFinalNum_for_week 16
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk30-AprC' ]  
then
#copy of week 20
#setxkbmap gr; # Change keyboard to greek
leafpad "WEEK TANK ,pixbot    activated --- Week number: $WEEKNUMBER" &
repeat 6  ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el "$GAMESEDU"pixbot "$SWFlocal"pack_A02.html?probeserver\&norightclick "
#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.dimotika.tk "$SWFlocal"pack_A02.html "
#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$SWFlocal"pack_A02.html http://pixbot.dimotika.tk"	
echo "empty"
# EASTER 2020 KLEISTA
fi

adjustWeekFinalNum_for_week 17
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk31-AprD' ]  
then
echo "empty"
# EASTER 2020 KLEISTA

#Να βάλω αυτο week 17
repeat 7 ironstartincognito ""$SWFlocal"pack_codeorg_movies.html?probeserver "$SWFlocal"pack_A03.html?probeserver\&norightclick "$SERVER"gamesedu/tortuga-kids-logo-gr/"


repeat 7 ironstartincognito ""$SWFlocal"pack_gamesedu.html?probeserver "$SWFlocal"pack_A06.html?probeserver\&norightclick"

#repeat 7 ironstartincognito ""$SWFlocal"pack_url_param.html?url1=http://192.168.1.200/gamesedu/stick2animator/\&url2=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr/\&url3=http://192.168.1.200/gamesedu/lightbot_haan/\&url4=http://192.168.1.200/gamesedu/blockly-games//&url5=http://192.168.1.200/swf/pack_codeorg_movies.html\&url6=http://192.168.1.200/oneye/"


#repeat 7 ironstartincognito ""$SWFlocal"pack_url_param.html?url1=http://192.168.1.200/gamesedu/stick2animator/\&url2=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr/\&url3=http://192.168.1.200/gamesedu/lightbot_haan/\&url4=http://192.168.1.200/gamesedu/blockly-games//&url5=http://192.168.1.200/gamesedu/faces-guess-who-gr/faces.html\&url6=http://192.168.1.200/oneye/"
fi


########### MAY ###################
adjustWeekFinalNum_for_week 18
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk32-AprE-MayA' ]  
then
echo "empty"
leafpad "WEEK 18 GFX2 pt B (Aft-Easter  activated --- Week number: $WEEKNUMBER" &

# EASTER 2020
repeat 7 ironstartincognito ""$SWFlocal"pack_gfx2.html?probeserver "$SWFlocal"pack_A03.html?probeserver\&norightclick "$SERVER"gamesedu/stick2animator/ "$SERVER"zx/zx_htm2tap/" 
fi

adjustWeekFinalNum_for_week 19
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk33-MayB' ]  
then
leafpad "WEEK lightbot SWF, A-B:Funbrain,StickMan epanalipsi activated --- Week number: $WEEKNUMBER" &	
#__(pack_code_lightbotswf EXEI: lightbotswf,turtlepond,tortuga.patatak,tiny-explor,packA03	
repeat 6  ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?probeserver\&timer2 "$SWFlocal"funbrain.html?probeserver "$SERVER"gamesedu/stick2animator/"
#ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?probeserver\&timer2"
echo "empty"
fi

adjustWeekFinalNum_for_week 20
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk34-MayC' ]  
then
#setxkbmap gr; # Change keyboard to greek
leafpad "WEEK TANK ,pixbot    activated --- Week number: $WEEKNUMBER" &
repeat 6  ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el "$GAMESEDU"pixbot "$SWFlocal"pack_A02.html?probeserver\&norightclick "
#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.dimotika.tk "$SWFlocal"pack_A02.html "
#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$SWFlocal"pack_A02.html http://pixbot.dimotika.tk"	
echo "empty"
fi

adjustWeekFinalNum_for_week 21
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk35-MayD' ]  
then
# ******** TO DO add tinyxls lesson ***********	
leafpad "WEEK maybe XLS,BASIC (open iron+chrome)    activated --- Week number: $WEEKNUMBER" &
####xx#leafpad "google chrome works BUT RUFFLE runs SLOW in clients (HW acceleration issue)"
#repeat 7 googlehomestartincognito ""$SWFlocal"pack_A05_ruffle.html?probeserver "$SERVER"x-spreadsheet/tinyxls.html?file=lesson1-timetable&jsonxls=lesson1-timetable&showsubmit "$SERVER"zx/zx_htm2tap/"" "$SWFlocal"pack_itch_gamedesign.html?probeserver"
repeat 7 googlehomestartincognito ""$SERVER"x-spreadsheet/tinyxls.html?file=lesson1-timetable&jsonxls=lesson1-timetable&showsubmit "$SERVER"zx/zx_htm2tap/"" "$SWFlocal"pack_itch_gamedesign.html?probeserver" &


repeat 6 ironstartincognito ""$SWFlocal"pack_A05.html?probeserver "$SERVER"x-spreadsheet/tinyxls.html?file=lesson1-timetable\&jsonxls=lesson1-timetable\&showsubmit "$SERVER"zx/zx_htm2tap/"
repeat 6 ironstartincognito ""$SWFlocal"pack_A05.html?probeserver "$SWFlocal"pack_A02.html?probeserver "$SERVER"zx/zx_htm2tap/"
ironstartincognito ""$SWFlocal"pack_A05.html?probeserver "$SWFlocal"pack_A02.html?probeserver" &
#ironstartincognito ""$SWFlocal"pack_A05.html "$SWFlocal"pack_A02.html" &
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls"
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls"
ironstartincognito ""$SWFlocal"pack_A05.html "$SWFlocal"pack_A02.html" &

echo "empty"
fi

adjustWeekFinalNum_for_week 22
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk36-MayE' ]  
then
#http://localhost/x-spreadsheet/tinyxls.html?file=lesson2b-bookstore&jsonxls=lesson2b-bookstore&showsubmit
#ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&file=lesson10 "$SWFlocal"pack_A03.html?probeserver\&norightclick"
#repeat 6  ironstartincognito ""$SERVER"x-spreadsheet/tinyxls.html?file=lesson1-timetable\&jsonxls=lesson1-timetable\&showsubmit "$SWFlocal"pack_A03.html?probeserver\&norightclick"
repeat 6  ironstartincognito ""$SERVER"x-spreadsheet/tinyxls.html?file=lesson2a-bookstore\&jsonxls=lesson2a-bookstore\&showsubmit "$SWFlocal"pack_A03.html?probeserver\&norightclick"


#ironstartincognito ""$SERVER"x-spreadsheet/tinyxls.html?file=lesson1-timetable\&jsonxls=lesson1-timetable\&showsubmit "$SWFlocal"pack_A03.html?probeserver\&norightclick"



ironstartincognito "http://tinyxls.sxoleio.win/tinyxls.html?file=lesson1-timetable\&jsonxls=lesson1-timetable\&showsubmit "$SWFlocal"pack_A03.html?probeserver\&norightclick"
echo "empty"
#http://tinyxls.dimotika.tk/tinyxls.html?file=lesson1-timetable&jsonxls=lesson1-timetable&showsubmit
fi


########### JUNE ###################

adjustWeekFinalNum_for_week 23
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk37-JuneA' ]  
then
repeat 6 ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&file=lesson10 "$SWFlocal"pack_A03.html?probeserver\&norightclick"
#ironstartincognito ""$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&file=lesson10 "$SWFlocal"pack_A03.html?probeserver\&norightclick"



echo "empty"
fi

adjustWeekFinalNum_for_week 24
if [ $WEEKNUMBER == $WEEKFINALNUM ] || [ "$WEEKNUMBER" == 'wk38-JuneB' ]  
then
echo "empty"

fi












############## ALL WEEKS END #################



# ALWAYS SHOW
leafpad "ALWAYS_SHOW_THIS " &
adjustWeekFinalNum_for_week 00000000000000000000000 NOT USED 000000000000000000000000000000000

#sakura &
#xdotool type "cat /proc/cpuinfo"; xdotool key Return;
#leafpad "/mnt/live/memory/images/changes-exit/upperdir/etc/hostname"

repeat 5 ironstartincognito ""$SWFlocal"pack_A03.html?probeserver\&norightclick 
"$SWFlocal"funbrain.html?timer3 "$SERVER"tinymce_class/tinymce_submit.html?showsubmit\&probeserver http://ALWAYS_SHOW_THIS"


adjustWeekFinalNum_for_week 999


if [ $DAYOFWEEK == 'Δευτέρα' ] || [ $DAYOFWEEK == 'Monday' ]
then
echo "Δευτέρα"
#: '# ΔΕΥΤΕΡΑ
# DEYTERA ΔΕΝ ΕΚΑΝΕ gfx1
#---------------------------- Γ1
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/5 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_d1.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh ""$SERVER"gamesedu/lightbot_haan/index.php?map=maps_easy.txt "$SWFlocal"pack_A02.html --incognito"
#---------------------------- Γ2
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ2--hour4.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_d1.txt "$SWFlocal"pack_A02.html"
# ΕΙΧΑΝ ΠΡΟΒΑ ΔΕΥΤΕΡΑ 18-3 και δεν κάναν το rover
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh ""$SERVER"gamesedu/lightbot_haan/index.php?map=maps_easy.txt "$SWFlocal"pack_A02.html --incognito"
#---------------------------- ΣΤ2
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ2--hour5.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh "--incognito "$SERVER"gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt "$SWFlocal"pack_A02.html"
#---------------------------- ΣΤ1
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ1--hour6.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh "--incognito "$SERVER"gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt "$SWFlocal"pack_A02.html"
# ΔΕΥΤΕΡΑ '

adjustWeekFinalNum_for_week 11
if [ $WEEKNUMBER == $WEEKFINALNUM ]
then
#---------------------------- Γ1
leafpad "WEEK11 activated --- Week number: $WEEKNUMBER"
#---------------------------- Γ2

#---------------------------- ΣΤ2

#---------------------------- ΣΤ1
fi

adjustWeekFinalNum_for_week 12
if [ $WEEKNUMBER == $WEEKFINALNUM ]
then



echo "empty"
#---------------------------- Γ1
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#---------------------------- Γ2
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#---------------------------- ΣΤ2
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#---------------------------- ΣΤ1
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
fi


fi
### END of ΔΕΥΤΕΡΑ ##########################################


if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
then
echo "Τρίτη"
#: '# ΤΡΙΤΗ
#----------------------------Δ2
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#ironstart $CODEORGcourse1"13/puzzle/8 "$LANDINGpage"15-ΤΡΙΤΗ-Δ2--hour1.html "$SWFlocal"fun/frogger3d.swf"
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Δ2--hour1.html  http://tortuga.dimotiko.tk"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#----------------------------A ταξη
#ironstart ""$SERVER"gamesedu/faces-guess-who-gr/faces.html  , "$SERVER"gamesedu/blockly-games/el/index.html"
#ironstart "$SERVER"swf/fun/maze/mouse_maze_game_play_10_1_!!.swf "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html http://tortuga.dimotiko.tk"
#ironstart ""$SWFlocal"ab/coloring-inside-out__noADsURL.swf "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html "$SWFlocal"ab/coloring_walking_frankie_coloring_page_noAdsUrl_!!.swf"
#/opt/eduActiv8/eduActiv8
#sudo -u puppy bash -c "/opt/eduActiv8/eduActiv8 &";
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstart ""$SWFlocal"pack_A04.html "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html http://ts.sch.gr/repo/online-packages/dim-glossa-a-b/start.html "$SWFlocal"pack_A01.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#----------------------------Ε1
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#@ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Ε1--hour4.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/10 "$LANDINGpage"15-ΤΡΙΤΗ-Ε1--hour4.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#---------------------------- Δ1
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstart ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Δ1--hour5.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"13/puzzle/1 "$LANDINGpage"15-ΤΡΙΤΗ-Δ1--hour5.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#----------------------------Ε2
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstart ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Ε2--hour6.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/1 "$LANDINGpage"15-ΤΡΙΤΗ-Ε2--hour6.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
# ΤΡΙΤΗ'
fi

if [ $DAYOFWEEK == 'Τετάρτη' ] || [ $DAYOFWEEK == 'Wednesday' ]
then
echo "Τετάρτη"
#: '# ΤΕΤΑΡΤΗ
#/opt/eduActiv8/eduActiv8
#----------------------------B1 15o TETARTH
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"ab/coloring-inside-out__noADsURL.swf "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"ab/coloring_walking_frankie_coloring_page_noAdsUrl2_!!.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstart ""$SWFlocal"pack_A04.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html http://typefun.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"5/puzzle/1 "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#----------------------------B2 15o TETARTH
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3="$SERVER"gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstart ""$SWFlocal"pack_A04.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β2--hour6.html "$SWFlocal"pack_A01.html http://typefun.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"5/puzzle/1 "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β2--hour6.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
# ToDO  $GAMESEDU"faces-guess-who-gr/faces.html"  , $GAMESEDU"gamesedu/blockly-games/el/index.html"

# ΤΕΤΑΡΤΗ'
fi






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

# following opens many tabs (note the double quotes "")
#. iron_flash_puppy_pepper_sda1.sh $CODEORGcourse1"8/puzzle/1 https://studio.code.org/s/course1"
# lightbot :
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php "$SERVER"lightbot_NORMAL_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_d1.txt "$SERVER"lightbot_NumberEASY_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_random_1(4x4_3lights).txt "$SERVER"lightbot_maps_random_1(4x4_3lights).txtEASY_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_random_3(5lights).txt "$SERVER"lightbot_maps_random_3(5lights).txt_moderate_LEVELs --incognito"


# . iron_flash_puppy_pepper_home.sh ""$SERVER"gamesedu/Code-Commander-gr/index_dot_links.html "$SERVER"Code-Commander-gr --incognito"


#christmas :
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/5 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

#Office file load (writer)
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"


#pack load
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"pack_A01.html "



#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html "$SERVER"landing_pages/PEMPTH-ST1--hour3__dim10.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html "$SERVER"landing_pages/PEMPTH-E2--hour6__dim10.html"


#ironstart ""$SWFlocal"swf_giortes/christmas.html "$SERVER"landing_pages/ΤΕΤΑΡΤΗ-Γ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# A1
#ironstart ""$SWFlocal"swf_giortes/christmas.html "$LANDINGpages"ΤΕΤΑΡΤΗ-Α1--hour2__dim10.html  "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

#coding :
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html\&url5=ΦΤΙΑΞΕ KOMIK"

#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$SWFlocal"pack_A02.html http://pixbot.dimotika.tk "$SWFlocal"fun/frogger3d__noNavURL_10lives!!.swf"

#"$SERVER"tinymce_class/tinymce.html?probeserver&file=lesson05
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url2=fun/maze/the-maze-game\(robot\)__no_jp_utl.swf\&url3=ab/ladybugs_TRODLER_noADsURL@.swf\&url4=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url5=fun/td/BloonsTowerDefense2_ok4slow_p4_NoNavUrl.swf\&url6=maze-1"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/labrat__maze-kids_needFastPC_unencr2noAdsURL_cheat_GR01_!!.swf\&url2=fun/maze/minotaur_122_maze__unencr3_noAdsUrl_!.swf\&url3=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url4=ab/ladybugs_TRODLER_noADsURL@.swf\&url5=fun/physics/soccer-balls__physics__noADurl.swf\&url6=maze-2"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/spongebob-parking_jon04noURLS_need760MBram_!!.swf\&url2=fun/puzzle_board/edsparkinggame.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=fun/puzzle_board/spark_chess_17521__allows_save_NoNavUrl.swf\&url6=park-1"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/lightbot-codehour-gr_NoNavUrl.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html\&url5=ΚΩΔΙΚΑΣ"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html\&url5=ΚΩΔΙΚΑΣ"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/typing_bricks__puzzle!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks__puzzle!!!.swf\&url4=type/typing_tidepool__sea_race_!!.swf\&url5=typing-2"

#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"

#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
#ironstartincognito ""$GAMESEDU"tortuga-kids-logo-gr"
#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
#ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SERVER"swf/swf_ramkid_cds2k5/Ramkid_12feb_apokries/index.html "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFgiortes"index_halloween.html"
#ironstartincognito ""$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFlocal"pack_A02.html"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstart ""$SWFlocal"pack_A01.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

# epoptes Scratch run command : "run-as-user /appimages/scratux-1.4.1.AppImage"

