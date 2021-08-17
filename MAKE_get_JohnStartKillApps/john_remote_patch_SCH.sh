# COPY (& make executable) this script to : 
# /mnt/live/memory/images/changes-exit/root/Startup/


############ From here setup starting apps
#cd /tmp
#wget http://192.168.1.200/uploads/john_start_kill_apps.sh --directory-prefix=/tmp/
#chmod a+x /tmp/john_start_kill_apps.sh
#. /tmp/john_start_kill_apps.sh

#try remote (to change files  stretchdog-debdive32/live/ )
cd /tmp


#change dimotiko MYNAME to what is needed
(SCHOOL_SCRIPT=john_downloads_remote_dim-MYNAME.sh; cd /tmp/;wget  -T 7 "http://swf-dim.matheme.win/4class_sfs/""$SCHOOL_SCRIPT" --directory-prefix=/tmp/; chmod a+x "/tmp/""$SCHOOL_SCRIPT";./"$SCHOOL_SCRIPT")