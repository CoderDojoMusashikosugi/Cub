# 環境
- ros2 : foxy (humble & galactic検討中)

# install
```
git clone --recursive https://github.com/CoderDojoMusashikosugi/Cub.git
cd Cub
```
# Configuration
ホストPC側のEthernet設定を192.168.0.XXに設定するのを忘れないでください（XXは被らない適当な値）

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

2D-lidarの実行（**/scan**トピックに点群データが通知されます。）
```
source ../scripts/lidar2d.sh
```
