## Calling script (SAMPLE FILE:
# v210105 - logging
#cd /tmp/
#change dimotiko number to what is needed
#wget  -T 7 http://swf.patatakia.tk/4class_sfs/john_downloads_remote_dim-vrasna.sh --directory-prefix=/tmp/
#chmod a+x /tmp/john_downloads_remote_dim-vrasna.sh
#./john_downloads_remote_dim-vrasna.sh
schoolname="arethousa"
URL="http://localhost/tinymce_class/"
wget $URL"handle-submit.php?schoolname=$schoolname&HOSTNAME=$HOSTNAME"

####################################################################
# SERVER
TARGET_FOLDER="/mnt/home/stretchdog-debdive64/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"
fi

####################################################################
# CLIENT 32
TARGET_FOLDER="/mnt/home/stretchdog-debdive32/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"

#TARGET_FOLDER="/mnt/home/stretchdog-debdive32/live/";cd "$TARGET_FOLDER";wget --no-clobber --directory-prefix="$TARGET_FOLDER" -O "askiseis_office_htdocs_desktop_v02g_191129.squashfs" "https://aaa.com/?frc9hqwpmkxc61yx7mtx"; mv "askiseis_office_htdocs_desktop_v02f_191128.squashfs" "askiseis_office_htdocs_desktop_v02f_191128.squashfs_OLD";mv "askiseis_office_htdocs_desktop_v02d_190131b.squashfs" "askiseis_office_htdocs_desktop_v02d_190131b.squashfs_OLD";mv "askiseis_office_htdocs_desktop_v02e_191120.squashfs" "askiseis_office_htdocs_desktop_v02e_191120.squashfs_OLD"

#TARGET_FOLDER="/mnt/home/stretchdog-debdive32/live/";cd "$TARGET_FOLDER";wget --no-clobber --directory-prefix="$TARGET_FOLDER" -O "zzz_desktop_root_puppy_jon_cfg_dim_v06b_191201.squashfs" "https://aaa.com/?kigq6vh1rfd29ooggm5u";mv "zzz_desktop_root_puppy_jon_cfg_dim_v06a_191017.squashfs" "zzz_desktop_root_puppy_jon_cfg_dim_v06a_191017.squashfs_OLD";mv "zzz_desktop_root_dim_v05e_190222.squashfs" "zzz_desktop_root_dim_v05e_190222.squashfs_OLD"
    
    
fi

####################CLIENT 64
TARGET_FOLDER="/mnt/home/schdog64clnt/live/";
if [ -d "$TARGET_FOLDER" ]; then
    echo "$TARGET_FOLDER is a directory & EXISTS"
   
fi