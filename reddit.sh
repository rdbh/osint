#!/usr/bin/env bash
opt1="Reddit Search (Active)"
opt2="Subreddit Download (Active)"
opt3="Redditsfinder (Deleted)"
redditmenu=$(zenity  --list  --title "Reddit Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" --height=400 --width=300) 
case $redditmenu in
$opt1 ) 
mkdir ~/Documents/Reddit/
cd ~/Downloads/Programs/bulk-downloader-for-reddit
python3 script.py --directory ~/Documents/Reddit/
nautilus ~/Documents/Reddit/ >/dev/null
exit;;
$opt2 ) 
url=$(zenity --entry --title "Subreddit Download (Active)" --text "Enter Subreddit")
cd ~/Downloads/Programs/bulk-downloader-for-reddit
python3 script.py --subreddit "$url" --directory ~/Documents/Reddit/$url/
nautilus ~/Documents/Reddit/$url >/dev/null
exit;;
$opt3 ) 
url=$(zenity --entry --title "Redditsfinder (Deleted)" --text "Enter Reddit Username")
mkdir ~/Documents/Reddit/
cd ~/Documents/Reddit/
redditsfinder "$url" | zenity --progress --pulsate --no-cancel --auto-close --title="Redditsfinder" --text="Data being saved"
nautilus ~/Documents/Reddit/users/$url >/dev/null
exit;;esac
