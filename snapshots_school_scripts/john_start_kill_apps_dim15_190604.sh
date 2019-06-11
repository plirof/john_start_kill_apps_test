# kill firefox (if you want )
pkill -f firefox
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


load_extra_apps(){
# used to activate events (eg pasxa, halloween, etc)	
cd /tmp
wget ""$SERVER"uploads/john_extra_apps.sh" --directory-prefix=/tmp/
chmod a+x /tmp/john_extra_apps.sh
. /tmp/john_extra_apps.sh

}

ironstart() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper_home.sh "$1"
return 5
}

ironstartincognito() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper_home.sh "--incognito ""$1"
return 5
}

ironchangesdat() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper.sh "--incognito ""$1"
return 5
}

oookidsopen()
{
# eg oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
$OOOKIDS$OOOKIDSpathprefix"$1"
return 5
}

lightbot_iron_browser() {
# NOTE : ONLY foir custom MAPS. for normal just run : . iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/
# eg  lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=""$1"
. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.html?map=""$1"" NOTE-uses_PHP-must_enable_XAMPP"
return 5	
}

firefox10() {
#. firefox10-puppy-home.sh "$1"
#eg firefox10 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
su -l puppy -c '/opt/firefox10/firefox -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/firefox10" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
return 5
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

################  TEST COMMANDS #############
probe_the_server &

#ironstartincognito "http://192.168.1.200/ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
leafpad "Week number: $WEEKNUMBER" &

#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$SWFlocal"pack_A02.html http://pixbot.patatakia.tk "$SWFlocal"fun/frogger3d__noNavURL_10lives!!.swf"


#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url2=fun/maze/the-maze-game\(robot\)__no_jp_utl.swf\&url3=ab/ladybugs_TRODLER_noADsURL@.swf\&url4=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url5=fun/td/BloonsTowerDefense2_ok4slow_p4_NoNavUrl.swf\&url6=maze-1"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/maze/labrat__maze-kids_needFastPC_unencr2noAdsURL_!!.swf\&url2=fun/maze/minotaur_122_maze__unencr3_noAdsUrl_!.swf\&url3=fun/maze/Diego_Dinosaur_Rescue_maze_KIDS_simple_NotTImed_!!!.swf\&url4=ab/ladybugs_TRODLER_noADsURL@.swf\&url5=fun/physics/soccer-balls__physics__noADurl.swf\&url6=maze-2"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=fun/spongebob-parking_jon04noURLS_need760MBram_!!.swf\&url2=fun/puzzle_board/edsparkinggame.swf\&url3=type/typing_bricks\(puzzle\)!!!.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=fun/puzzle_board/spark_chess_17521__allows_save_NoNavUrl.swf\&url6=park-1"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/lightbot-codehour-gr_NoNavUrl.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html\&url5=ΚΩΔΙΚΑΣ"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html\&url5=ΚΩΔΙΚΑΣ"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/typing_bricks\(puzzle\)!!!.swf\&url2=type/assault-typing__shootemup__rapidtyping.com_NoAdUrl.swf\&url3=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url4=type/typing_alphattack2__bombDrop_NoNavUrl.swf\&url5=type/airtyper_1_noADsURL.swf\&url6=typing-1"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=type/airtyper_1_noADsURL.swf\&url2=type/typing_adventure__indiana_jones_NoNavUrl.swf\&url3=type/typing_bricks\(puzzle\)!!!.swf\&url4=type/typing_tidepool\(sea_race\)_!!.swf\&url5=typing-2"

#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"

#ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
#ironstartincognito ""$GAMESEDU"tortuga-kids-logo-gr"
#ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
#ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia http://192.168.1.200/swf/swf_ramkid_cds2k5/Ramkid_12feb_apokries/index.html "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFgiortes"index_halloween.html"
#ironstartincognito ""$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFlocal"pack_A02.html"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstart ""$SWFlocal"pack_A01.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
##########parallel
#ironstart ""$SWFlocal"swf_giortes/index_halloween.html?timer3" &
#. /usr/local/bin/tuxpaint-with-conf.sh &
#wait

################# END OF TEST COMMANDS ##########


##################  FULL WEEK EVENTS #################################
# Προγραμματισμός εβδομάδων    date +%V    WEEKNUMBER=17 #TEST :
# WEEKNUMBER=17 #TEST
if [ "$WEEKNUMBER" == '12' ] || [ "$WEEKNUMBER" == '13' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK 12,13 GFX1 ptA, PTB   activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFlocal"pack_gfx1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_gfx1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_gfx1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf&probeserver"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf&probeserver"
fi

if [ "$WEEKNUMBER" == '14' ] || [ "$WEEKNUMBER" == '14' ]
then
#--------------------- this is for Full week-all classes events 
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

ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
fi


if [ "$WEEKNUMBER" == '15' ] || [ "$WEEKNUMBER" == '15' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK easter ptA    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
ironstartincognito ""$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
ironstartincognito ""$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
ironstartincognito ""$SERVER"ramkid/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
ironstartincognito ""$SWFlocal"ramkidpedia_vol20_pasxa1.html "$SWFlocal"ramkid_giortes_pasxa_pt1.html"
fi

if [ "$WEEKNUMBER" == '16' ] || [ "$WEEKNUMBER" == '19' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK easter ptB    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFgiortes"index_easter.html?probeserver "$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el "$SWFlocal"pack_A02.html http://pixbot.patatakia.tk "
ironstartincognito ""$SWFgiortes"index_easter.html?probeserver "$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el "$SWFlocal"pack_A02.html http://pixbot.patatakia.tk "
ironstartincognito ""$SWFgiortes"index_easter.html?probeserver "$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el "$SWFlocal"pack_A02.html http://pixbot.patatakia.tk "
ironstartincognito ""$SWFgiortes"index_easter.html?timer3\&probeserver"
ironstartincognito ""$SWFgiortes"index_easter.html?timer3\&probeserver"
ironstartincognito ""$SWFgiortes"index_easter.html?timer3\&probeserver"
fi

if [ "$WEEKNUMBER" == '20' ] || [ "$WEEKNUMBER" == '20' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK TANK ,pixbot    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A02.html?probeserver " 
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.2_pinakas_sports.xls" &
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A02.html?probeserver "
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A02.html?probeserver "
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.2_pinakas_sports.xls" &
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A02.html?probeserver "
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.2_pinakas_sports.xls"
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A02.html?probeserver "
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.2_pinakas_sports.xls"
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.2_pinakas_sports.xls"
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$SWFlocal"pack_A02.html http://pixbot.patatakia.tk"
fi


if [ "$WEEKNUMBER" == '21' ] || [ "$WEEKNUMBER" == '21' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "Week number: $WEEKNUMBER " &
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls" &
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A06.html?probeserver "
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls" &
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A06.html?probeserver "
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A06.html?probeserver "
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls" &
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A06.html?probeserver "
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls"
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$GAMESEDU"blockly-games/el/index.html?lang=el http://pixbot.patatakia.tk "$SWFlocal"pack_A06.html?probeserver "
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls"
$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/excel_1.1_pinakas_mathitwn.xls"
ironstartincognito ""$GAMESEDU"Code-Commander-gr/index_dot_links.html "$SWFlocal"pack_A02.html?probeserver http://pixbot.patatakia.tk"

fi

if [ "$WEEKNUMBER" == '23' ] || [ "$WEEKNUMBER" == '23' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK lightbot swf Week number: $WEEKNUMBER " &
ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?timer4\&probeserver "$SWFlocal"pack_recycle.html?probeserver "$SWFlocal"pack_paint1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?timer4\&probeserver "$SWFlocal"pack_recycle.html?probeserver "$SWFlocal"pack_paint1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?timer4\&probeserver "$SWFlocal"pack_recycle.html?probeserver "$SWFlocal"pack_paint1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?timer4\&probeserver "$SWFlocal"pack_recycle.html?probeserver "$SWFlocal"pack_paint1.html?probeserver"
ironstartincognito ""$SWFlocal"pack_code_lightbotswf.html?timer4\&probeserver "$SWFlocal"pack_recycle.html?probeserver "$SWFlocal"pack_paint1.html?probeserver"

fi


#LAST WEEK SCRIPT
if [ "$WEEKNUMBER" == '24' ] || [ "$WEEKNUMBER" == '24' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "Week number: $WEEKNUMBER RESTORING ubuntu as default" &

	if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
	then
		echo "Τρίτη"

		bootloader_restore_orig_os_as_default()
		{
			cd /mnt/home/stretchdog-debdive32/live/
			mv -n "/mnt/home/menu.lst" "/mnt/home/menu.lst_OLDok"
			wget -c ""$SERVER"uploads/menu_restore_ubuntu-as_default.lst"
			cp -R "/mnt/home/stretchdog-debdive32/live/menu_restore_ubuntu-as_default.lst" "/mnt/home/menu.lst"
			mv -n "/mnt/home/lickmenu.lst" "/mnt/home/lickmenu.lst_OLDok"
			wget -c ""$SERVER"uploads/lickmenu_restore_win_as_default.lst"
			cp -R "/mnt/home/stretchdog-debdive32/live/lickmenu_restore_win_as_default.lst" "/mnt/home/lickmenu.lst"
			return 5
		}


		bootloader_restore_orig_os_as_default
	fi

fi


if [ "$WEEKNUMBER" == '24' ] || [ "$WEEKNUMBER" == '24' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "Week number: $WEEKNUMBER " &
ironstartincognito ""$SWFlocal"pack_A05.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_A05.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_A05.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_A05.html?timer3\&probeserver"
ironstartincognito ""$SWFlocal"pack_A05.html?timer3\&probeserver"



fi




################## END OF FULL WEEK EVENTS #################################



#--------------- SPECIAL EVENTS --------------------------
#load_extra_apps

#201902118-22  , 2020 updated
if [ "$WEEKNUMBER" == '08' ] || [ "$WEEKNUMBER" == '08' ]
then
#--------------------- this is for Full week-all classes events    
leafpad "WEEK halloween ptA (ramkid_invitation_party , swf_ramkid_cds2k5/Ramkid_12feb_apokries , KidsPedia/kids_ePedia32cd/Volume13 )   activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$SWFpath"ramkid_giortes_apokries_pt1.html"
fi

#20190225-08  2020 updated
if [ "$WEEKNUMBER" == '09' ] || [ "$WEEKNUMBER" == '10' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK halloween ptB (for 2 weeks  games)   activated --- Week number: $WEEKNUMBER    20190225-08" &
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3"
fi


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
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh "http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_easy.txt "$SWFlocal"pack_A02.html --incognito"
#---------------------------- Γ2
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ2--hour4.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_d1.txt "$SWFlocal"pack_A02.html"
# ΕΙΧΑΝ ΠΡΟΒΑ ΔΕΥΤΕΡΑ 18-3 και δεν κάναν το rover
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh "http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_easy.txt "$SWFlocal"pack_A02.html --incognito"
#---------------------------- ΣΤ2
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ2--hour5.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt "$SWFlocal"pack_A02.html"
#---------------------------- ΣΤ1
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ1--hour6.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ΔΕΝ ΤΟ ΕΚΑΝΕ ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt "$SWFlocal"pack_A02.html"
# ΔΕΥΤΕΡΑ '

if [ "$WEEKNUMBER" == '11' ]
then
#---------------------------- Γ1
leafpad "WEEK11 activated --- Week number: $WEEKNUMBER"
#---------------------------- Γ2

#---------------------------- ΣΤ2

#---------------------------- ΣΤ1
fi


if [ "$WEEKNUMBER" == '12' ]
then
#---------------------------- Γ1
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#---------------------------- Γ2
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#---------------------------- ΣΤ2
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#---------------------------- ΣΤ1
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
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
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#----------------------------A ταξη
#ironstart "http://192.168.1.200/gamesedu/faces-guess-who-gr/faces.html  , http://192.168.1.200/gamesedu/blockly-games/el/index.html"
#ironstart http://192.168.1.200/swf/fun/maze/mouse_maze_game_play_10_1_!!.swf "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html http://tortuga.dimotiko.tk"
#ironstart ""$SWFlocal"ab/coloring-inside-out__noADsURL.swf "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html "$SWFlocal"ab/coloring_walking_frankie_coloring_page_noAdsUrl_!!.swf"
#/opt/eduActiv8/eduActiv8
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
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstart ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Δ1--hour5.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"13/puzzle/1 "$LANDINGpage"15-ΤΡΙΤΗ-Δ1--hour5.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"

#----------------------------Ε2
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
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
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#ironstart ""$SWFlocal"pack_A04.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html http://typefun.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"5/puzzle/1 "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"fun/frogger3d.swf"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
#----------------------------B2 15o TETARTH
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://192.168.1.200/gamesedu/tortuga-kids-logo-gr\&url4=pack_A03.html\&url5=ΦΤΙΑΞΕ-KOMIK\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
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
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php http://192.168.1.200/lightbot_NORMAL_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_d1.txt http://192.168.1.200/lightbot_NumberEASY_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_random_1(4x4_3lights).txt http://192.168.1.200/lightbot_maps_random_1(4x4_3lights).txtEASY_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_random_3(5lights).txt http://192.168.1.200/lightbot_maps_random_3(5lights).txt_moderate_LEVELs --incognito"


# . iron_flash_puppy_pepper_home.sh "http://192.168.1.200/gamesedu/Code-Commander-gr/index_dot_links.html http://192.168.1.200/Code-Commander-gr --incognito"


#christmas :
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/5 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

#Office file load (writer)
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"


#pack load
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"pack_A01.html "


# just for christmas :
#. $IRON" "$SWFlocal"swf_giortes/christmas.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#. /usr/local/bin/tuxpaint-with-conf.sh
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html"

#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ2--hour4.html "
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ2--hour5.html "
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ1--hour6.html "
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"pack_A01.html "


: '# ΠΑΣΧΑ easter
# ΠΑΣΧΑ easter 1
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia "$SWFlocal"pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia "$SWFlocal"pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia "$SWFlocal"pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia "$SWFlocal"pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia "$SWFlocal"pack_A02.html"
# ΠΑΣΧΑ easter 2

# ΠΑΣΧΑ easter 3
#ironstart ""$SWFlocal"swf_giortes/index_easter.html
#ironstart ""$SWFlocal"swf_giortes/index_easter.html
#ironstart ""$SWFlocal"swf_giortes/index_easter.html
#ironstart ""$SWFlocal"swf_giortes/index_easter.html

#ΑΠΟΚΡΙΕΣ'

#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/PEMPTH-ST1--hour3__dim10.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/PEMPTH-E2--hour6__dim10.html"


#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Γ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# A1
#ironstart ""$SWFlocal"swf_giortes/christmas.html "$LANDINGpages"ΤΕΤΑΡΤΗ-Α1--hour2__dim10.html  "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

#coding :
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=coding/Rover_nasa_GREEK1.swf\&url2=coding/Tiny-explorers__nice_puzzle_education_unencr_noAds_ok.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html"
#ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/comic_design__garfield_comic_creator_y8.swf\&url2=graphics_/animate_space__animation_studio_noAdUrl_!.swf\&url3=http://tortuga.dimotiko.tk\&url4=pack_A02.html\&url5=ΦΤΙΑΞΕ KOMIK"

