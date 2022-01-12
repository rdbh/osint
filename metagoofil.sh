#!/usr/bin/env bash
opt1="Metagoofil-Only"
opt2="Metagoofil+Exiftool"
domainmenu=$(zenity  --list  --title "Choose Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" --height=400 --width=300) 
case $domainmenu in
$opt1 ) 
domain=$(zenity --entry --title "Metagoofil-Only" --text "Enter target domain name")
mkdir ~/Documents/Metagoofil
mkdir ~/Documents/Metagoofil/"$domain"_docs
mkdir ~/Documents/Metagoofil/"$domain"_results
python3 ~/Downloads/Programs/metagoofil/metagoofil.py -d $domain -w -t pdf,doc,xls,ppt,docx,xlsx,pptx -o ~/Documents/Metagoofil/"$domain"_docs
nautilus ~/Documents/Metagoofil/
exit;;
$opt2 ) 
domain=$(zenity --entry --title "Metagoofil+Exiftool" --text "Enter target domain name")
mkdir ~/Documents/Metagoofil
mkdir ~/Documents/Metagoofil/"$domain"_docs
mkdir ~/Documents/Metagoofil/"$domain"_results
python3 ~/Downloads/Programs/metagoofil/metagoofil.py -d $domain -w -t pdf,doc,xls,ppt,docx,xlsx,pptx -o ~/Documents/Metagoofil/"$domain"_docs
cd ~/Documents/Metagoofil/"$domain"_docs
exiftool * -csv > ~/Documents/Metagoofil/"$domain"_results/Report.csv
nautilus ~/Documents/Metagoofil
exit;;esac
