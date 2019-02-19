#####################Variables , Init ######################################
#cd /mnt/home/stretchdog-debdive32/live/
cd /tmp/
#wget -c "http://192.168.1.52/uploads/"$PROGR
MYURL=http://192.168.1.200/uploads/
MYURL=https://raw.githubusercontent.com/plirof/john_start_kill_apps_test/master/test_startup.sh
#rm /tmp/john_aaaa.sh


####################functions#######################################
file_fetch() {
#echo Hello $1
#PROGR="askiseis_office_htdocs_desktop_v02b_190119.squashfs"
wget -c $MYURL$1
#mv -n $1 "/mnt/home/stretchdog-debdive32/live/"$1
#mv -n $1 "/mnt/home/stretchdog-debdive32/live/"$1
return 5
}

file_rename_old() {
mv -n $1 $1"_OLD"
mv -b $1 $1"_OLD2"
mv -f $1 $1"_OLD3"
return 5
}
###########################################################

file_fetch

chmod a+x test_startup.sh
. test_startup.sh


############ From here setup starting apps
: '
cd /tmp
wget http://192.168.1.200/uploads/john_start_kill_apps.sh
chmod a+x john_start_kill_apps.sh
. john_start_kill_apps.sh

#try remote (to change files  stretchdog-debdive32/live/ )
wget  -T 7 http://educ.swf.dimotiko.tk/4class_sfs/john_downloads_remote_15dimotiko.sh
chmod a+x john_downloads_remote_15dimotiko.sh
. john_downloads_remote_15dimotiko.sh
'
