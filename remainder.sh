#!/bin/bash
day=`date | cut -d " " -f3`
month=`date | cut -d " " -f2`
yearr=`date | cut -d " " -f6`
hour_current=`date | cut -d " " -f4 | cut -d ":" -f1`
minute_current=`date | cut -d " " -f4 | cut -d ":" -f2`
source=/tmp/.remainder/
filename=$source$day-$month-$yearr
if [ -f $filename ]
then 
IFS="	"
while read hour minute title message 
do
if [[ $hour -eq $hour_current && $minute -eq $minute_current ]]
then
notify-send $title $message
espeak -v female3 $title
fi
done <$filename 
fi

