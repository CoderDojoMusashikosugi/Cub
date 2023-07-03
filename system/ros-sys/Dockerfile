FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

ENV ROS_DISTRO humble

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

RUN apt install -y python3-colcon-common-extensions python3-rosdep python3-argcomplete python3-vcstool

RUN rosdep init && \
    rosdep update

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

# COPY ./entrypoint.sh /
# ENTRYPOINT [ "/bin/bash", "-c", "/entrypoint.sh" ]
