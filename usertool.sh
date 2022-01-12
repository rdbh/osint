#!/usr/bin/env bash
opt1="Sherlock"
opt2="SocialScan"
opt3="Holehe"
opt4="WhatsMyName"
usermenu=$(zenity  --list  --title "Username Utilities" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2"  FALSE "$opt3" FALSE "$opt4" --height=400 --width=300)
case $usermenu in
$opt1 )
handle=$(zenity --entry --title "Sherlock" --text "Enter Username")
echo Your document is processing and will open in a moment...
cd ~/Downloads/Programs/sherlock/sherlock
python3 sherlock.py $handle > ~/Documents/$handle-Sherlock.txt
xdg-open ~/Documents/$handle-Sherlock.txt
exit;;
$opt2)
handle=$(zenity --entry --title "SocialScan" --text "Enter Username or Email")
socialscan $handle
exit;;
$opt3)
handle=$(zenity --entry --title "Holehe" --text "Enter Email")
echo Your document is processing and will open in a moment...
holehe $handle > ~/Documents/$handle-Holehe.txt
xdg-open ~/Documents/$handle-Holehe.txt
exit;;
$opt4)
handle=$(zenity --entry --title "WhatsMyName" --text "Enter Username")
cd ~/Downloads/Programs/WhatsMyName
echo Your document is processing and will open in a few moments...
python3 web_accounts_list_checker.py -u $handle > ~/Documents/$handle-WhatsMyName.txt
xdg-open ~/Documents/$handle-WhatsMyName.txt
exit;;esac
