#!/bin/sh
#Il faut source devel/setup.bash dans le terminal courant
#the current terminal needs to be sourced
path_catkin_ws=`rospack find my_robot`
xterm -e "source devel/setup.bash && roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=${path_catkin_ws}/worlds/house.world" &
sleep 5
xterm -e "source devel/setup.bash && roslaunch turtlebot_rviz_launchers view_navigation.launch" & sleep 5

xterm -e "source devel/setup.bash && roslaunch turtlebot_gazebo amcl_demo.launch map_file:=${path_catkin_ws}/maps/map.yaml" &
sleep 5

xterm -e "source devel/setup.bash && rosrun add_markers add_markers"