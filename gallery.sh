#!/usr/bin/env bash
url=$(zenity --entry --title "Gallery Tool" --text "Enter target URL")
mkdir ~/Documents/gallery-dl
cd ~/Documents/gallery-dl
gallery-dl "$url"
nautilus ~/Documents/gallery-dl/
exit
