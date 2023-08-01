#!/bin/bash
RTK_BASE_STATION=ntrip1.bizstation.jp:E8B5845A
RTK_SENSER_ADDRESS=ttyACM0

cd /cub/colcon
colcon build --cmake-clean-cache
source install/setup.bash
ros2 launch ublox_gps ublox_gps_node-launch.py &

cd /cub/RTKLIB/lib/iers/gcc
make
cd /cub/RTKLIB/app/consapp
make
cd str2str/gcc
./str2str -in ntrip://$RTK_BASE_STATION -out serial://$RTK_SENSER_ADDRESS
