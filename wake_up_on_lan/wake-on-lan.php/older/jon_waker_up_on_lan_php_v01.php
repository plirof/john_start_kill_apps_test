<?php
//PHP_WOL::send('lab13-bl64-laptopprobpw', '64:31:50:69:7c:06', 9);

function wol2($broadcast, $mac)
{
    $hwaddr = pack('H*', preg_replace('/[^0-9a-fA-F]/', '', $mac));

    // Create Magic Packet
    $packet = sprintf(
        '%s%s',
        str_repeat(chr(255), 6),
        str_repeat($hwaddr, 16)
    );

    $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);

    if ($sock !== false) {
        $options = socket_set_option($sock, SOL_SOCKET, SO_BROADCAST, true);

        if ($options !== false) {
            socket_sendto($sock, $packet, strlen($packet), 0, $broadcast, 7);
            socket_close($sock);
        }
    }
}



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
wol("192.168.1.255", $mymac);
echo 'WOL sent to '.$mymac;






?>