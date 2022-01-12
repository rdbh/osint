#!/usr/bin/env bash
mkdir ~/Documents/Elasticsearch/
cd ~/Downloads/Programs/Elasticsearch-Crawler/
ip=$(zenity --entry --title "IP Address" --text "Enter target IP address")
index=$(zenity --entry --title "Index" --text "Enter target index" )
fields=$(zenity --entry --title "Fields" --text "Enter desired data fields (separated by space)")
python3 crawl.py $ip 9200 $index $fields > ~/Documents/Elasticsearch/$ip.txt
nautilus ~/Documents/Elasticsearch/
exit

