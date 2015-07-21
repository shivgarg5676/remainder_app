#!/bin/bash
variable=`zenity --forms --title="remainder control panel" --text "Enter the information about your remainder" \
	--separator="," \
	--add-entry="remainder title" \
	--add-entry="description" \
	--add-entry="time hh:mm" \
	--add-calendar="select the day"`
echo $variable
title=`echo $variable | cut -d "," -f1`
description=`echo $variable | cut -d "," -f2`
time=`echo $variable | cut -d "," -f3`
datee=`echo $variable | cut -d "," -f4`
hour=`echo $time | cut -d ":" -f1`
minute=`echo $time | cut -d ":" -f2`
day=`echo $datee | cut -d " " -f2`
month=`echo $datee | cut -d " " -f3`
year=`echo $datee | cut -d " " -f4`
month=${month:0:3}
filename=$day-$month-$year
filepath=/home/$USER/.remainder/$filename
remainder="$hour\t$minute\t$title\t$description"
echo -e $remainder >>$filepath
