FROM tiryoh/ros2-desktop-vnc:foxy

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        build-essential \
        ros-foxy-rviz2 \
        python3-colcon-common-extensions \
        ros-foxy-xacro \
        ros-foxy-robot-state-publisher 

WORKDIR $HOME
# RUN mkdir -p gazebo_ws/src
WORKDIR gazebo_ws/src
RUN git clone https://github.com/Pequi-Mecanico-Home/albot-description.git
WORKDIR /$HOME/gazebo_ws
RUN /bin/bash -c '. /opt/ros/foxy/setup.bash; colcon build --symlink-install' 

RUN echo "cd gazebo_ws" >> ~/.bashrc
RUN echo "source install/setup.bash" >> ~/.bashrc


RUN sysctl -w kernel.shmmax=2147483648