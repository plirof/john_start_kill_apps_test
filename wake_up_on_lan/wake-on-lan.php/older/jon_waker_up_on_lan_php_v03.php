<?php
//PHP_WOL::send('lab13-bl64-laptopprobpw', '64:31:50:69:7c:06', 9);

//https://stackoverflow.com/questions/6055293/wake-on-lan-script-that-works/20065289

$broadcast_ip="192.168.1.255";



$pc_array= [

("00:19:99:6a:a2:56"),


    ("64:31:50:69:7e:9e"),("00:19:99:6d:54:66"),("00:19:99:78:cf:5d"),("00:19:99:6e:e7:a1"),("00:24:7e:02:01:62"),("00:19:99:72:4c:79")

,"64:31:50:69:8e:02"

,("00:18:8b:03:21:8c"),("64:31:50:69:3c:85"),("00:19:99:7a:36:70"),("00:19:99:78:51:f5"),("64:31:50:69:7c:06")



    ];
/*
$pc_array= [

"lab01-bl64-e5300"=>"00:19:99:6a:a2:56",
"lab02-bl64-e8500"=>"00:19:99:6d:54:66",
"lab03-bl64-e5400"=>"00:19:99:72:4c:79",
"lab04-bl64-e8500"=>"00:19:99:78:51:f5",
"lab05-bl64-e5200"=>"00:19:99:6e:e7:a1",
"lab06b-bl64-laptop"=>"64:31:50:69:3c:85",
"lab07b-bl64-laptop"=>"64:31:50:69:8e:02",
"lab08-bl64-e2160"=>"00:24:7e:02:01:62",
"lab09-bl64-p4-2gb"=>"00:18:8b:03:21:8c",
"lab10-bl64-e5400"=>"00:19:99:7a:36:70",
"lab11-bl64-e5400"=>"00:19:99:78:cf:5d",
"lab12-bl64-laptop"=>"64:31:50:69:7e:9e",
"lab13-bl64-laptopprobpw"=>"64:31:50:69:7c:06"
    ];
*/

PRINT_R($pc_array);

function wol($broadcast, $mac){
$mac_array = preg_split('#:#', $mac); //print_r($mac_array);
$hwaddr = '';
    foreach($mac_array AS $octet){
    $hwaddr .= chr(hexdec($octet));
    }
    //Magic Packet
    $packet = '';
    for ($i = 1; $i <= 6; $i++){
    $packet .= chr(255);
    }
    for ($i = 1; $i <= 16; $i++){
    $packet .= $hwaddr;
    }
    //set up socket
    $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
    if ($sock){
    $options = socket_set_option($sock, 1, 6, true);
        if ($options >=0){    
        $e = socket_sendto($sock, $packet, strlen($packet), 0, $broadcast, 7);
        socket_close($sock);
        }    
    }
}  //end function wol



$mymac = "64:31:50:69:7c:06";
//wol($broadcast_ip, $mymac);
echo 'WOL sent to '.$mymac;

foreach($pc_array AS $pc)
{
wol($broadcast_ip, $pc);
echo '<BR>WOL sent to '.$pc;

}






?>