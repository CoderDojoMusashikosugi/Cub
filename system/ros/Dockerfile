FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# ROS install
ENV ROS_DISTRO foxy

RUN apt update && apt install -y locales software-properties-common tzdata -y
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN add-apt-repository universe
ENV LANG en_US.UTF-8
ENV TZ=Asia/Tokyo

RUN apt update && apt install -y curl gnupg2 lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update 
RUN apt upgrade -y

RUN apt install -y python3-pcl
RUN apt install -y ros-$ROS_DISTRO-desktop

RUN apt install -y python3-colcon-common-extensions python3-colcon-core python3-rosdep python3-argcomplete python3-vcstool

RUN rosdep init && \
    rosdep update

# RUN rosdep install -i --from-paths ./ws/colcon/urg_node2

# Utility install
RUN apt update
RUN apt install -y cu usbutils vim pip sudo
RUN apt install ros-$ROS_DISTRO-diagnostic-updater
RUN apt install ros-$ROS_DISTRO-rtcm-msgs
RUN apt install ros-$ROS_DISTRO-laser-proc

# ublox
RUN apt install libasio-dev

# Hesai lidar
RUN apt update
RUN apt install -y libpcl-dev libpcap-dev libboost-dev libyaml-cpp-dev
RUN apt install -y libprotobuf-dev protobuf-compiler

# user add
ARG UNAME=docker
ARG UPASS=docker
ARG UID=1000

RUN useradd -m -u $UID --groups sudo $UNAME && \
    echo $UNAME:$UPASS | chpasswd && \
    usermod --shell /bin/bash $UNAME && \
    usermod -aG sudo $UNAME && \
    echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$UNAME && \
    chmod 0440 /etc/sudoers.d/$UNAME && \
    usermod  --uid 1000 $UNAME && \
    groupmod --gid 1000 $UNAME

RUN gpasswd --add $UNAME dialout
USER $UNAME

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

WORKDIR /cub
COPY ./ws /cub
# ENTRYPOINT [ "/bin/bash", "-c", "/cub/entrypoint.sh" ]

