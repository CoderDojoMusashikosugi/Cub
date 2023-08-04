#!/bin/bash
RTK_BASE_STATION=rtk2go.com:1005/ZEKE_F9P#rtcm3
RTK_SENSER_ADDRESS=ttyACM0:115200#1111

cd /cub/RTKLIB/lib/iers/gcc
make
cd /cub/RTKLIB/app/consapp
make
cd str2str/gcc
./str2str -in ntrip://$RTK_BASE_STATION -out serial://$RTK_SENSER_ADDRESS
