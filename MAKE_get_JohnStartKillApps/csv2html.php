<?php
//v014a - added <li> (maybe not usefull)
//v013b get adjest week
//v011 autolink !!
//v010 seems to work
//v009
//v008
//v004
//v001

// Desc: Convert john_start_kill bash to html links (shows only near weeks)


/*

ALSO try these : 
http://code.seebz.net/p/autolink-php/  ****
javascript http://code.seebz.net/p/autolink-js/

*/

$file_to_parse="./john_start_kill_apps.sh";
#$file_to_parse="./order_lesson.txt";

$delimiters = array('|_|'); // How each line is divided
$count=0;


$ignore_bash_script_commented_lines=false; // ignores lines starting with # (for .sh scripts)
$weekofyear = date("W");
echo $weekofyear;
$check_week=true; // show week of year only values





function autolink($str, $attributes=array()) {
    $attrs = '';
    foreach ($attributes as $attribute => $value) {
        $attrs .= " {$attribute}=\"{$value}\"";
    }

    $str = ' ' . $str;

    $replacement_string='<li>'.'$1<a target=_blank href="$2"'.$attrs.'>$2</a></li>';

 // ORIG ok working jon 210525
    $str = preg_replace(
        '`([^"=\'>])((http|https|ftp)://[^\s<]+[^\s<\.)])`i',
         $replacement_string,
        $str
    );



    $str = substr($str, 1);
    
    return $str;
}



//$string_of_file = file_get_contents('./order_lesson.txt', true);

$string_of_file = file_get_contents($file_to_parse, true);


$string_modified=replaceDelimiters($string_of_file);
//echo "$string_modified";
//$string_modified=makeHref($string_modified); //problematic

$string_modified=autolink($string_modified); //Seems to work !!!!!!!!

if ($check_week){
    $substring = "adjustWeekFinalNum_for_week";
    $result = get_string_between($string_modified , $substring." ".($weekofyear-1), $substring." ".($weekofyear+2) );
    //echo "<h1> <hr>".$substring." ".($weekofyear-1)."<hr>".$substring." ".($weekofyear+2)."<hr>".$result."</h1>" ;
    $string_modified=$result;
}

//$string_modified=formatUrlsInText($string_modified); //Seems to work ok issues with some splitting


//str_replace($search, $replace, $subject);

//$string_modified=str_replace('[', '<BR>', $string_modified); echo("ZZZZZZZZZ".$string_modified); //DEBUG
//echo "<hr size =100>";

 echo '<ol type="1"> <table border="1"> ';

//exit ();
//=============== FORMAT to tables ===========================
$row = 2;
$AllData = str_getcsv($string_modified, "\n"); //parse the rows
//foreach($AllData as &$Row) $Row = str_getcsv($Row, "[") {
foreach($AllData as $data1) { 
        //echo "<h1>$data1</h1>";
        $data = str_getcsv($data1, "[")   ;  
        
        //print_r($data);
        

        $num = count($data);
        //echo "<h1>num=$num ________  data1=$data1</h1>";


        if ($row == 1) {
            echo '<thead><tr>';
        }else{
            echo '<tr>';
        }
       
        for ($c=0; $c < $num; $c++) {
           // if ($ignore_bash_script_commented_lines) if($data[$c][0]"#")echo "HELLO";//NOT WORKING
            //echo $data[$c] . "<br />\n";
            if(empty($data[$c])) {
               $value = "&nbsp;";
            }else{
               $value = $data[$c];
            }
            if ($row == 1) {
                echo '<th>'.$value.'</th>';
            }else{
                echo '<td>'.$value.'</td>';
            }
        }
       
        if ($row == 1) {
            echo '</tr></thead><tbody>';
        }else{
            echo '</tr>';
        }
        $row++;

}
 //parse the items in rows







/**
 * Will replace a number of CSV delimiters to one specific character
 * @param $file     CSV file
 */
function replaceDelimiters($str,$prefixserverurl='http://192.168.1.200/')
{
    // Delimiters to be replaced: pipe, comma, semicolon, caret, tabs
   //$delimiters = array('|', ';', '^', "\t");
 
    //$delimiters = array('|_|');
    global $delimiters;
    $delimiter = '[';
    //str_replace($search, $replace, $subject);
    //$str = file_get_contents($file);
    $str = str_replace($delimiters, $delimiter, $str);


    $str = str_replace('""$SWFlocal"', $prefixserverurl."swf/", $str);
    $str = str_replace(' "$SWFlocal"', " http://192.168.1.200/swf/", $str);
    $str = str_replace('"$SWFpath"', $prefixserverurl."swf/", $str);
    $str = str_replace('$SWFgiortes"', $prefixserverurl."swf/swf_giortes/", $str);
    $str = str_replace('$RAMKIDpathprefix"', $prefixserverurl."ramkid/", $str);
    $str = str_replace('lightbot_iron_browser "', $prefixserverurl."gamesedu/lightbot_haan/index.html?map=", $str);
    $str = str_replace('""$GAMESEDU"', $prefixserverurl."gamesedu/", $str);
    $str = str_replace('"$GAMESEDU"', $prefixserverurl."gamesedu/", $str);

    $str = str_replace('ironstart ', "", $str);
    $str = str_replace('ironstartincognito ', "", $str);


    $str = str_replace('\&', "&", $str);
    $str = str_replace('"', " ", $str);
    

    $str = str_replace('html"', "html", $str); // IMPORTANT !!!



    



    $str = str_replace('aaaaaaa', "", $str);
    $str = str_replace('aaaaaaa', "", $str);
    $str = str_replace('aaaaaaa', "", $str);


    $delimiters = array('|_|');
    $delimiter = '[';



    //file_put_contents($file, $str);
    return $str;
}




function get_string_between($string, $start, $end){
    global $weekofyear,$check_week;



    $string = ' ' . $string;
    $ini = strpos($string, $start);
    if ($ini == 0) return '';
    $ini += strlen($start);
    $len = strpos($string, $end, $ini) - $ini;
    return substr($string, $ini, $len);
}

?>
