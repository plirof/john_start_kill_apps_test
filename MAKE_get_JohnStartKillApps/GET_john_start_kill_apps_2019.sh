# Script ver 190912a
# Script called by client
# WILL NOT Stop the parent script from executing (so don't try pkill -chrome)
# put this file in /opt/lampp/htdocs/swf


CODEorg=https://studio.code.org/s/course1/stage/
LANDINGpages="http://192.168.1.200/uploads/landing_pages/"
SWFlocal="http://192.168.1.200/swf/"
SWFpath="http://192.168.1.200/swf/"
SWFgiortes="http://192.168.1.200/swf/swf_giortes/"


####################functions#######################################
file_fetch() {
#echo Hello $1
#PROGR="askiseis_office_htdocs_desktop_v02b_190119.squashfs"
wget -c $MYURL$1
mv -n $1 "/mnt/home/stretchdog-debdive32/live/"$1
return 5
}

file_rename_old() {
mv -n $1 $1"_OLD"
mv -b $1 $1"_OLD2"
mv -f $1 $1"_OLD3"
return 5
}
###########################################################
#rm /mnt/home/stretchdog-debdive32/live/*.*_OLD2
#rm /mnt/home/stretchdog-debdive32/live/*.*_OLD3
#rm /mnt/home/stretchdog-debdive32/live/*.*_OLD 



############ From here setup starting apps
#cd /tmp
#wget http://192.168.1.200/uploads/john_start_kill_apps.sh --directory-prefix=/tmp/
#chmod a+x /tmp/john_start_kill_apps.sh
#. /tmp/john_start_kill_apps.sh

#try remote (to change files  stretchdog-debdive32/live/ )
#cd /mnt/home/downloads_linux/uploads/
cd /tmp/
#change dimotiko number to what is needed
wget  -T 7 http://swf.patatakia.tk/4class_sfs/john_start_kill_apps_dim2019.sh --directory-prefix=/tmp/
chmod a+x /tmp/john_start_kill_apps_dim2019.sh

cd /mnt/home/downloads_linux/uploads/
file_rename_old "/mnt/home/downloads_linux/uploads/john_start_kill_apps.sh"
cp -n /tmp/john_start_kill_apps_dim2019.sh /mnt/home/downloads_linux/uploads/john_start_kill_apps.sh
#. /tmp/john_downloads_remote_10dimotiko.sh 