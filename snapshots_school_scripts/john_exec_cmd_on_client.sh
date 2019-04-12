# Script called by client
# WILL NOT Stop the parent script from executing (so don't try pkill -chrome)

CODEorg=https://studio.code.org/s/course1/stage/
LANDINGpages="http://192.168.1.200/uploads/landing_pages/"
SWFlocal="http://192.168.1.200/swf/"
SWFpath="http://192.168.1.200/swf/"
SWFgiortes="http://192.168.1.200/swf/swf_giortes/"
#---------
GAMESEDU="http://192.168.1.200/gamesedu/"
GAMESEDUtortuga=""$GAMESEDU"tortuga-kids-logo-gr"
GAMESEDUtank=""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
#----------

OOOKIDS="ooo4kids1.3 -n "
OOOKIDSpathprefix="/opt/lampp/htdocs/askiseis_office/"
RAMKIDpathprefix="http://192.168.1.200/ramkid/"

#date "+%A"   : Δευτέρα , Τρίτη , Τετάρτη , Πέμπτη , Παρασκευή 
# echo $(date -d "+1 days" "+%A")
DAYOFWEEK=$(date "+%A")  
WEEKNUMBER=`date +%V`

oookidsopen()
{
# eg oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
$OOOKIDS$OOOKIDSpathprefix"$1"
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

firefox10() {
#. firefox10-puppy-home.sh "$1"
#eg firefox10 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
su -l puppy -c '/opt/firefox10/firefox -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/firefox10" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
return 5
}

lightbot_iron_browser() {
# NOTE : ONLY foir custom MAPS. for normal just run : . iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/
# eg  lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=""$1"

# CHANGES DAT
. iron_flash_puppy_pepper.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.html?map=""$1"
return 5	
}

#pkill -f firefox
#pkill -f chrome



#leafpad "Run Command time:"$(date +"%T")"  -  Week number: $WEEKNUMBER" &
#ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#/opt/eduActiv8/eduActiv8
#. /usr/local/bin/tuxpaint-with-conf.sh 
#ironchangesdat ""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
