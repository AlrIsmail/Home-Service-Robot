# Home service Robot
## packages
### Localization and Maping
To build a map of the environment with a robot equipped with laser range finder sensors or RGB-D cameras.  
For localization we used the AMCL package which utilizes Adaptive Monte Carlo Localization (AMCL) which uses a particle filter to track the pose of a robot against a known map.  
For mapping we used RTAB-Map (Real-Time Appearance-Based Mapping), a RGB-D SLAM approach based on a global loop closure detector with real-time constraints. This package can be used to generate a 3D point clouds of the environment and/or to create a 2D occupancy grid map for navigation.   
We also used the ROS Teleop package in conjuction with RTAB-Map to help create the map which the AMCL package could then use for localization.   
Teleop was used to control the robot and navigate it around our enviornment so that it can map out the environment using the RTAB-Map package.
### Navigation
For navigation we used the ROS navigation stack which creates a path for the robot based on Dijkstra's algorithm a Search algorithm, which creates a path to the goal position while avoiding obstacles on the path.
### Marker
The node implements params used by the marker class to determine when to hide/show the marker based off the robots location.  
The node pick_objects subscribes to the marker location.   
Once it recieves data from the marker publisher it sends the bot to pickup the marker.   
Then once it picks up the marker it waits 5 seconds, drops off the marker at the dropoff location.  
    

## enviroment setup
### requirements
-ROS kinetic
```bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ..
catkin_make
sudo apt-get update
cd ~/catkin_ws/src
git clone https://github.com/ros-perception/slam_gmapping
git clone https://github.com/turtlebot/turtlebot
git clone https://github.com/turtlebot/turtlebot_interactions
git clone https://github.com/turtlebot/turtlebot_simulator
cd ~/catkin_ws/
source devel/setup.bash
rosdep -i install gmapping
rosdep -i install turtlebot_teleop
rosdep -i install turtlebot_rviz_launchers
rosdep -i install turtlebot_gazebo
catkin_make
source devel/setup.bash
```
