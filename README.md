# Simulate_Robot_UR5_Kinetic
The repository contains the complete information of simulate robot ur5 w/ Kinetic inside nvidia docker env.

# Reference Source
The project code part is derived from 
  @misc{Huang2018,
    author = {Huang, L., Zhao, H.},
    title = {Implementation of UR5 pick and place in ROS-Gazebo with a USB cam and vacuum grippers},
    year = {2018},
    publisher = {GitHub},
    journal = {GitHub repository},
    howpublished = {\url{https://github.com/lihuang3/ur5_ROS-Gazebo.git}}
  }

The modification based on the source are:
1. Running in Nvidia container because few reality to allocate dedicated env for the combination of <ROS dist, Ubuntu dist>;
2. Fix the failure during "roslaunch ur5_notebook initialize.launch" per the inputs of experiencers running the source project https://github.com/lihuang3/ur5_ROS-Gazebo.
