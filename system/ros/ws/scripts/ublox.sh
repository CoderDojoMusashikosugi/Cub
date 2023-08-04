#!/bin/bash
cd /cub/colcon
colcon build --cmake-clean-cache
source install/setup.bash
ros2 launch ublox_gps ublox_gps_node-launch.py &
