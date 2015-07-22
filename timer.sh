#!/bin/bash
time=`date | cut -d " " -f4 | cut -d ":" -f1,2`
minute=`date | cut -d " " -f4 | cut -d ":" -f2`
if (( minute%$1==0 )) 
then
notify-send $time
espeak -v female3 "the time is $time" 
fi

