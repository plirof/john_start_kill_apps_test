#####################Variables , Init ######################################
cd /mnt/home/stretchdog-debdive32/live/
#wget -c "http://192.168.1.52/uploads/"$PROGR
MYURL=http://192.168.1.200/uploads/
rm /tmp/john_start_kill_apps.sh


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


# 190417 gcompris & games
file_fetch "libgl1-mesa-dri-glx_13.0.6-1+b2_amd64-i386_v02.deb.squashfs"
file_fetch "gcompris-qt-0.96-Linux32_v03b__req_libgl1-mesa-dri-glx.squashfs"
file_rename_old "gcompris-qt-0.96-Linux32_v02c__GRfontProb.squashfs"
file_fetch "uextract_v330_v02.squashfs"

file_fetch "fheroes2-20150122-linux-r3274.tar.gz_v01b.squashfs"

file_fetch "xampp-linux-x86_7.0.8-0_160628.squashfs"

#activ*
file_fetch "eduactiv8-4.18.12-linux32.zip_v01.squashfs"
file_fetch "eduactiv8_greek_config_v01.squashfs"
file_rename_old "eduActiv8-3.80.411-linux32.zip_v02need_python.squashfs"


#java update
file_fetch "jre-8u202-linux-i586.tar.gz_v01.squashfs"
file_rename_old "jre-1.7u45-i586.sfs.squashfs"

# various gaming stuff
file_fetch "arcadeflex0.56.1_MAME_java_v03h.squashfs"
file_fetch "openxcom_x32-x64_20190408_withOXCE_v04e.squashfs"

#sync using xampp's proftpd  
file_fetch "ncftp_3.2.5-2_i386.deb_sch_v03.squashfs"
#file_rename_old "ncftp_3.2.5-2_i386.deb_sch_v02.squashfs"

file_rename_old "tzupdate.py.deactivate_v01.squashfs"

# update 20190212
file_fetch  "z_jon_update--from_200_v03.squashfs"
file_rename_old "z_jon_update--from_200_v02.squashfs"
file_rename_old "z_jon_update--from_200.squashfs"

file_fetch  "make_files_folder_777_downloads_linux.sh"


# update 20190123
file_fetch "zz_desktop_hide-delete_files_wh_v01.squashfs"


file_fetch "ooo4kids_config_v02a.squashfs"
#file_fetch "ooo4kids_config_v01a.squashfs"
file_rename_old "ooo4kids_config_v01a.squashfs"

# config desktop
file_fetch "zzz_desktop_root_dim_v05e_190222.squashfs"
file_rename_old "desktop_root_dim_v01_181010_.squashfs"
file_rename_old "zzz_desktop_root_dim_v03a_181028oookids.squashfs"


#190118 new ASKISEIS askiseisdocs_desktop_v02a_181104.squashfs"
file_fetch "askiseis_office_htdocs_desktop_v02d_190131.squashfs"
file_rename_old "askiseis_office_htdocs_desktop_v02c_190119.squashfs"
file_rename_old "askiseis_office_htdocs_desktop_v02b_190119.squashfs"
file_rename_old "askiseis_office_htdocs_desktop_v02a_181104.squashfs"




#190118 new static IP script
#file_fetch "static_ip_set200_v04a_firewall_scripts.squashfs"
#file_rename_old "static_ip_set200_v04a_firewall_scripts.squashfs"

#PROGR="static_ip_set200_v04a_firewall_scripts.squashfs"
#wget -c $MYURL$PROGR
#mv -n $PROGR "/mnt/home/stretchdog-debdive32/live/"$PROGR

#PROGR="static_ip_set200_v03b_ok.squashfs"
#mv -n $PROGR $PROGR"_OLD"


#update firefox10  190218 
file_fetch "firefox-10.0.12esr_i386.tar.bz2_v01d_190218FlashStandalone.squashfs"

file_rename_old "firefox-10.0.12esr_i386.tar.bz2_v01c_190110FlashStandalone.squashfs"
file_rename_old "firefox-10.0.12esr.tar.bz2_auto_v01b_181030.squashfs"
file_rename_old "firefox-10.0.12esr.tar.bz2_auto_v01_180919.squashfs"

#update firefox24
file_fetch "firefox-24.8.1esr__140924.tar.bz2_v03_190220Flash4tabs.squashfs"
file_rename_old "firefox-24.8.1esr__140924.tar.bz2_auto_v02_190220FlashStandAlone.squashfs"

file_fetch "palemoon_28.4.0+repack-1_i386.deb_auto_190221.squashfs"




file_fetch "zz05_doublecmdZ_cfg01d.squashfs"
#file_fetch "zz05_doublecmdZ_cfg01e_1line.squashfs"


# leave EXIT WILL not SAVE NOW 
file_fetch "z_EXIT_no_save_on_poweroff_v03_onlyWithSave2flash.squashfs"
file_rename_old "z_EXIT_no_save_on_poweroff_v02b.squashfs"
file_rename_old "z_EXIT_no_save_on_poweroff.squashfs"



file_fetch "epoptes-client-autostart_v02.squashfs"





file_fetch "gcompris_15.10-1+b1_i386.deb.el-v003nosound.squashfs"


file_fetch "iron32_flash_v61.deb_v02b-wflash.squashfs"


#PROGR="pysiogame_sd32_apt2sfs_v01_181112.squashfs"
#wget -c $MYURL$PROGR
#mv -n $PROGR "/mnt/home/stretchdog-debdive32/live/"$PROGR







file_fetch "firefox_62.0.2-i686el.tar.bz2_auto_v02_181020-no-remote.squashfs"

#mv "firefox_62.0.2-i686el.tar.bz2_auto_v01b_180929.squashfs" "firefox_62.0.2-i686el.tar.bz2_auto_v01b_180929.squashfs_OLD"



#PROGR="firefox-mozilla-build_50.0-0ubuntu1_i386.deb_v01.squashfs"
#wget -c $MYURL$PROGR
#mv -n $PROGR "/mnt/home/stretchdog-debdive32/live/"$PROGR



file_fetch "ooo4kids-el_1.3-1_i386.deb_v04.squashfs"


#PROGR="pack_edu-level2_Gcompris)OK_EN_GR_asri20150403_310_!!.sfs.squashfs"
#wget -c $MYURL$PROGR
#mv -n $PROGR "/mnt/home/stretchdog-debdive32/live/"$PROGR

#PROGR="pack_games-level2_ALL_asri20140403_310_okSD32.sfs.squashfs"
#wget -c $MYURL$PROGR
#mv -n $PROGR "/mnt/home/stretchdog-debdive32/live/"$PROGR

file_fetch "fbxkb_0.6-2+b1_i386.deb_v01b.squashfs"


## MOVE rename delete files



mv "/mnt/live/memory/changes/root/.config/mimeapps.list" "/mnt/live/memory/changes/root/.config/mimeapps.list_OLD"

mv "/mnt/live/memory/changes/root/.config/mimeapps.list" "/mnt/live/memory/changes/root/.config/mimeapps.list_OLD"


#rm -y "pack_games-level2_ALL_asri20140403_310_okSD32.sfs.squashfs"
#rm "pack_games-level2_ALL_asri20140403_310_okSD32.sfs.squashfs"
#rm "pack_edu-level2_Gcompris)OK_EN_GR_asri20150403_310_!!.sfs.squashfs"




PROGR="zzz_desktop_root_dim_v03a_181028oookids_.squashfs"
mv -n $PROGR $PROGR"_OLD"

PROGR="pysiogame_sd32_apt2sfs_v01_181112.squashfs"
mv -n $PROGR $PROGR"_OLD"

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
wget http://192.168.1.200/uploads/john_start_kill_apps.sh --directory-prefix=/tmp/
chmod a+x /tmp/john_start_kill_apps.sh
. /tmp/john_start_kill_apps.sh

#try remote (to change files  stretchdog-debdive32/live/ )
cd /tmp
#change dimotiko number to what is needed
wget  -T 7 http://swf.patatakia.tk/4class_sfs/john_downloads_remote_10dimotiko.sh --directory-prefix=/tmp/
chmod a+x /tmp/john_downloads_remote_10dimotiko.sh
. /tmp/john_downloads_remote_10dimotiko.sh 
