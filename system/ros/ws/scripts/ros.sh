#!/bin/bash
cd /cub/colcon
colcon build --parallel-workers 1 --cmake-clean-cache --symlink-install
source install/setup.bash
source install/local_setup.bash
