# this creates a list of hostnames/MACs on the network
echo "[General]" > wol_config_SCANNED.ini
echo "broadcast=192.168.1.255" >> wol_config_SCANNED.ini
echo >> wol_config_SCANNED.ini

arp | grep "eth0" | awk '{print $1,$3}' | sed 's/eth0//g' | \
while read -r a ; do echo "[" `echo $a | awk '{print $1}'` "]" | tr -d ' ' >> wol_config_SCANNED.ini; \
echo "mac="`echo $a | awk '{print $2}'` >> wol_config_SCANNED.ini; echo >> wol_config_SCANNED.ini; done