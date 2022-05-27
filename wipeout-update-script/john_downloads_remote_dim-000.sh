## Calling script :
# put this script on path "$URL""$FILE" (as define lower)
# v210105 - logging
# v200925
#cd /tmp/
#script to save to client /root/startup 
#change dimotiko number to what is needed

#Wipeout & update script is the file that will call THIS online script:
wipeout_script_for_lab_client_root_startup () {
#This function is NOT used here - it must be put in anothe exec file    
#WIPEOUT script  make a file of it and put it on (changes.dat) /root/Startup
# WIPEOUT calls remotelly this bash script and then executes it
cd /tmp ;
FILE="john_downloads_remote_dim-000.sh";
URL="http://swf-dim.matheme.win/4class_sfs/";
#change FILE to sch dim name
#wget "$URL""$FILE" -T 10  --directory-prefix=/tmp/;
for i in {1..20};do
sleep 5
wget -T 10 "$URL""$FILE"  && break
done
chmod a+x /tmp/"$FILE";
sh ./"$FILE";
echo "$URL""$FILE";
echo "END"
}


schoolname="onoma-dimotikou"
URL="http://swf-dim.matheme.win/4class_sfs/"
HOSTNAME="swf-dim.matheme.win"
wget $URL"handle-submit.php?schoolname=$schoolname&HOSTNAME=$HOSTNAME"

####################################################################
# SERVER
TARGET_FOLDER="/mnt/home/stretchdog-debdive64/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"

#Remove changes.dat file (for wiping everything type: rm -r "$TARGET_FOLDER")
#rm -r "$TARGET_FOLDER"changes.dat
#echo "$TARGET_FOLDER"changes.dat

#TARGET_FOLDER="/mnt/home/stretchdog-debdive64/live/";cd "$TARGET_FOLDER";wget --no-clobber --directory-prefix="$TARGET_FOLDER" -O "ramkid_Kidspedia_giortes_ONLY_v01.squashfs" "https://aaa.net/?x5gss2wqufc8fjit2emi";TARGET_FOLDER="/mnt/home/stretchdog-debdive64/live/";cd "$TARGET_FOLDER";wget --directory-prefix="$TARGET_FOLDER" -O "swf_giortes_v07b_190416.squashfs" "https://aaa.net/?6rkgtg6imfdbt384r6vi";
    
fi


####################SERVER bustet64
TARGET_FOLDER="/mnt/home/dogbuster_mklive64/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"

    
fi
####################################################################
# CLIENT 32
TARGET_FOLDER="/mnt/home/stretchdog-debdive32/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"

#TARGET_FOLDER="/mnt/home/stretchdog-debdive32/live/";cd "$TARGET_FOLDER";wget --no-clobber --directory-prefix="$TARGET_FOLDER" -O "askiseis_office_htdocs_desktop_v02g_191129.squashfs" "https://aaa.net/?frc9hqwpmkxc61yx7mtx"; mv "askiseis_office_htdocs_desktop_v02f_191128.squashfs" "askiseis_office_htdocs_desktop_v02f_191128.squashfs_OLD"

    
    
fi

####################CLIENT 64
TARGET_FOLDER="/mnt/home/schdog64clnt/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"

    
fi