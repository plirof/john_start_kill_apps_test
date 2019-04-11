# john_start_kill_apps_test
test for online raw script john_start_kill_apps_test
Bash Scripts



# Examples

## Weekday if

WEEKNUMBER=`date +%V`
# date --date="1984-12-18" +"%V"

if [ "$WEEKNUMBER" == '11' ]
then
#---------------------------- Γ1
leafpad "WEEK11 activated --- Week number: $WEEKNUMBER"
#---------------------------- Γ2

#---------------------------- ΣΤ2

#---------------------------- ΣΤ1
fi




## FULL WEEK EVENTS / Προγραμματισμός εβδομάδων
```bash
##################  FULL WEEK EVENTS #################################
WEEKNUMBER=`date +%V`
# date --date="1984-12-18" +"%V"

# Προγραμματισμός εβδομάδων :
if [ "$WEEKNUMBER" == '12' ] || [ "$WEEKNUMBER" == '13' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK 12,13 GFX1 ptA, PTB    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFlocal"pack_gfx1.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx1.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx1.html?timer3"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
ironstartincognito ""$SWFlocal"pack_url_param.html?url1=graphics_/paint_artpad_y8_GREEK_noNavAdUrl.swf\&url2=graphics_/paint_lily_paint_magic_GOOD_PALLETE_NoNavAdUrl_!!.swf\&url3=graphics_/animate_draw_your_cartoon_character_GREEK1_noAdsUrl.swf\&url4=pack_A02.html\&url5=GFX1\&url6=sumopaint1025_GREEK_NoNavUrl1_v4b_progray.swf"
fi

if [ "$WEEKNUMBER" == '14' ] || [ "$WEEKNUMBER" == '14' ]
then
#--------------------- this is for Full week-all classes events 
leafpad "WEEK GFX2 ptA, PTB    activated --- Week number: $WEEKNUMBER" &
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3"
fi
################## END OF FULL WEEK EVENTS #################################
```

## Bash loop in background
```bash
while /bin/true; do
    something_in_the_background
done &
```

