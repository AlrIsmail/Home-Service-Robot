#!/bin/sh
#source devel/setup.bash before runing srcript
path_catkin_ws=`rospack find my_robot`
xterm -e "source devel/setup.bash; roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=${path_catkin_ws}/worlds/house.world" & 
sleep 5


xterm -e "source devel/setup.bash; roslaunch turtlebot_gazebo gmapping_demo.launch" &
sleep 5

xterm -e "source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5

xterm -e "source devel/setup.bash; roslaunch turtlebot_teleop keyboard_teleop.launch" 