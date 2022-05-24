#!/bin/bash
isrunning=`pgrep  xray`
if [ -z $isrunning ]; then
    nohup ~/soft/xray/xray -config ~/soft/xray/vmess.json >/dev/null 2>&1 & 
fi
