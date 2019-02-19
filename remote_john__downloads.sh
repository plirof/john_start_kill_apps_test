########## Your client downloads this file remotely and runs it. This will then download the update files (squashfs). You will need another reboot to run this
#(https://raw.githubusercontent.com/plirof/john_start_kill_apps_test/master/remote_john__downloads.sh)
#
# To Do:
# - Download squashfs updates from 1fichier dropbox
#
#
# Changes :
# 190219:
# -auto download remote_john_start_kill_apps.sh remotely
#
#
#
#####################Variables , Init ######################################
cd /mnt/home/stretchdog-debdive32/live/
#wget -c "http://192.168.1.52/uploads/"$PROGR
MYURL=http://192.168.1.200/uploads/
REMOTEURL=https://raw.githubusercontent.com/plirof/john_start_kill_apps_test/master/
REMOTEFILESERVER=https://1fichier.com/
rm /tmp/remote_john_start_kill_apps.sh
#rm /tmp/remote_john__downloads.sh


####################functions#######################################
file_fetch() {
#echo Hello $1
#PROGR="askiseis_office_htdocs_desktop_v02b_190119.squashfs"
wget -c $MYURL$1
mv -n $1 "/mnt/home/stretchdog-debdive32/live/"$1
return 5
}

file_rename_old() {
#cd /mnt/home/stretchdog-debdive32/live/	
mv -n $1 $1"_OLD"
mv -b $1 $1"_OLD2"
mv -f $1 $1"_OLD3"
cd /tmp
return 5
}
###########################################################

rm /mnt/home/stretchdog-debdive32/live/*.*_OLD2
#rm /mnt/home/stretchdog-debdive32/live/*.*_OLD3
#rm /mnt/home/stretchdog-debdive32/live/*.*_OLD

# update 20190125
file_fetch  "z_jon_update--from_200_v03.squashfs"
file_rename_old "z_jon_update--from_200_v02.squashfs"
file_rename_old "z_jon_update--from_200.squashfs"

# update 20190123
file_fetch "zz_desktop_hide-delete_files_wh_v01.squashfs"


file_fetch "ooo4kids_config_v02a.squashfs"
#file_fetch "ooo4kids_config_v01a.squashfs"
file_rename_old "ooo4kids_config_v01a.squashfs"

# config desktop
file_fetch "zzz_desktop_root_dim_v05a_190123.squashfs"
file_rename_old "zzz_desktop_root_dim_v04f_190116oookids.squashfs"
file_rename_old "zzz_desktop_root_dim_v03c_190115oookids.squashfs"
file_rename_old "zzz_desktop_root_dim_v03b_190114oookids.squashfs"
file_rename_old "zzz_desktop_root_dim_v04a_190116oookids.squashfs"
file_rename_old "zzz_desktop_root_dim_v03a_181028oookids.squashfs"
file_rename_old "zzz_desktop_root_dim_v04a_190123.squashfs"


#190118 new ASKISEIS askiseisdocs_desktop_v02a_181104.squashfs"
file_fetch "askiseis_office_htdocs_desktop_v02d_190131.squashfs"
file_rename_old "askiseis_office_htdocs_desktop_v02c_190119.squashfs"
file_rename_old "askiseis_office_htdocs_desktop_v02b_190119.squashfs"
file_rename_old "askiseis_office_htdocs_desktop_v02a_181104.squashfs"



#update firefox10
file_fetch "firefox-10.0.12esr_i386.tar.bz2_v01c_190110FlashStandalone.squashfs"
file_rename_old "firefox-10.0.12esr.tar.bz2_auto_v01b_181030.squashfs"
file_rename_old "firefox-10.0.12esr.tar.bz2_auto_v01_180919.squashfs"




file_fetch "zz05_doublecmdZ_cfg01e_1line.squashfs"


file_fetch "z_EXIT_no_save_on_poweroff_v02b.squashfs"
file_rename_old "z_EXIT_no_save_on_poweroff.squashfs"



file_fetch "epoptes-client-autostart_v02.squashfs"


file_rename_old "zz05_doublecmdZ_cfg01d.squashfs"


file_fetch "gcompris_15.10-1+b1_i386.deb.el-v003nosound.squashfs"


file_fetch "iron32_flash_v61.deb_v02b-wflash.squashfs"


#PROGR="pysiogame_sd32_apt2sfs_v01_181112.squashfs"
#wget -c $MYURL$PROGR
#mv -n $PROGR "/mnt/home/stretchdog-debdive32/live/"$PROGR

file_fetch "eduActiv8-3.80.411-linux32.zip_v02need_python.squashfs"
file_fetch "eduactiv8_greek_config_v01.squashfs"



file_fetch "firefox_62.0.2-i686el.tar.bz2_auto_v02_181020-no-remote.squashfs"

mv "firefox_62.0.2-i686el.tar.bz2_auto_v01b_180929.squashfs" "firefox_62.0.2-i686el.tar.bz2_auto_v01b_180929.squashfs_OLD"





file_fetch "ooo4kids-el_1.3-1_i386.deb_v04.squashfs"


file_fetch "fbxkb_0.6-2+b1_i386.deb_v01b.squashfs"


## MOVE rename delete files



#mv "/mnt/live/memory/changes/root/.config/mimeapps.list" "/mnt/live/memory/changes/root/.config/mimeapps.list_OLD"
#mv "/mnt/live/memory/changes/root/.config/mimeapps.list" "/mnt/live/memory/changes/root/.config/mimeapps.list_OLD"


#rm -y "pack_games-level2_ALL_asri20140403_310_okSD32.sfs.squashfs"
#rm "pack_games-level2_ALL_asri20140403_310_okSD32.sfs.squashfs"
#rm "pack_edu-level2_Gcompris)OK_EN_GR_asri20150403_310_!!.sfs.squashfs"

#PROGR="eduActiv8-3.80.411-linux32.zip_v01need_python.squashfs"
#mv -n $PROGR $PROGR"_OLD"


#PROGR="zzz_desktop_root_dim_v03a_181028oookids_.squashfs"
#mv -n $PROGR $PROGR"_OLD"

#PROGR="pysiogame_sd32_apt2sfs_v01_181112.squashfs"
#mv -n $PROGR $PROGR"_OLD"

#PROGR="epoptes-client-autostart_.squashfs"
#mv -n $PROGR $PROGR"_OLD"
#PROGR="epoptes-client-autostart.squashfs"
#mv -n $PROGR $PROGR"_OLD"

#PROGR="/opt/doublecmd/doublecmd.xml"
#mv -n $PROGR $PROGR"_OLD"

#PROGR="/mnt/live/memory/images/changes-exit/opt/doublecmd/doublecmd.xml"
#mv -n $PROGR $PROGR"_OLD2"

#PROGR="/mnt/live/memory/changes/opt/doublecmd/doublecmd.xml"
#mv -n $PROGR $PROGR"_OLD2"



############ From here setup starting apps
cd /tmp
:'
wget http://192.168.1.200/uploads/john_start_kill_apps.sh
chmod a+x john_start_kill_apps.sh
. john_start_kill_apps.sh

#try remote (to change files  stretchdog-debdive32/live/ )
wget  -T 7 http://educ.swf.dimotiko.tk/4class_sfs/john_downloads_remote_15dimotiko.sh
chmod a+x john_downloads_remote_15dimotiko.sh
. john_downloads_remote_15dimotiko.sh
'

#try remote (to change files  stretchdog-debdive32/live/ )
wget  -T 7 ""$REMOTEURL"remote_john_start_kill_apps.sh"
chmod a+x remote_john_start_kill_apps.sh
. remote_john_start_kill_apps.sh