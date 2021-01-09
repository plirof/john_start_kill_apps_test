<?php
/*
210105 - Modified to log access from old clients (saves to saved_access_data folder)
200902 - initial version - different file per submission 
Changes

*/
// file name different each time:  sn101-B2-DATE-paradopoulos.htm
// file contents : textarea + sn101-B2-DATE-paradopoulos

//$schoolname-

print_r ($_REQUEST);


// Function to get the client IP address
function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}



$mytext=$_REQUEST["text_entered"] ;

echo "<HR>";
//$cur_date= date('Ymd');
$file_name=date('Ymd')."sch-".$_REQUEST["schoolname"]."-hostname=".$_REQUEST["HOSTNAME"]."-"."-IP=".get_client_ip().".htm";

echo $file_name;
//$file_name=$cur_date;


$myfile = fopen("saved_access_data/".$file_name, "w") or die("Unable to open file!");
$txt = "<h2>$file_name</h2>\n";
fwrite($myfile, $txt);
$txt = "$mytext\n TIME= ".date("h:i:sa");
fwrite($myfile, $txt);
fclose($myfile);





?>