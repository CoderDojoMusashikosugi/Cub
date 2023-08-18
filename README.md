# 環境
- ros2 : foxy (humble & galactic検討中)

# install
```
git clone https://github.com/CoderDojoMusashikosugi/Cub.git
cd Cub
git submodule update --init
cd system/ros/ws/colcon/urg_node2
git submodule update --init
```

# Configuration
## **./system/ros/ws/colcon/urg_node2/config/paams_ether.yaml** file.
change ip_address from **192.168.0.10** to **192.168.0.20**

# build & run

ワークスペースに移動（docker composeは今のところ非対応）
```
cd system/ros/ws
```

dockerのビルド
```
source init.sh
```

dockerの実行
```
source start.sh
```

ros2のビルド
```
source scripts/ros.sh
```

2D-lidarの実行
```
source ../scripts/lidar2d.sh
```
