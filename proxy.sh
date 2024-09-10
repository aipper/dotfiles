#!/bin/bash
isrunning=`pgrep  naive`
if [ -z $isrunning ]; then
    #nohup xray -config ~/soft/xray/vmess.json >/dev/null 2>&1 & 
    nohup ~/soft/naiveproxy/naive  -c ~/soft/naiveproxy/config.json > /dev/null 2>&1 &
fi
