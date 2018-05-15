# MATLAB

## Introduction
We used MATLAB for the majority of the control for our robot, this is because every movement had to be calculated and MATLAB along with the RVC toolbox provides allot of useful functions and commands that can make repetitive code much simpler. These are commands that perform forward and inverse kinematics, commands that multiply large matrices,and commands that allow us to publish the data via ROS.  

## ROS publisher
For MATLAB to publish to a ROS topic we created a function called ROS_out.m, this function would receive two inputs, a matrix (4x1) and a single gripper value (0 or 1), the matrix refers to the joint states to achieve the desired position and the gripper values decides if the gripper is open or closed (Gripper value of 1 opens gripper). the function combines these values into a matrix 5x1 and then outputs this to ROS.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_ROSout.png"/>  
</p>
[Link to code](https://github.com/AandJ/ROCO224/blob/master/CODE/MATLAB/ROS_out.m)  
We looped the send command to fix an issue where our arm skipped certain positions due to MATLAB to publishing the data.  

## ROS subscriber
We also needed to read information from a ROS topic to obtain the data from the openCV node, to do this we created a second function called openCV_in.m, this function had no inputs but returned 3 values, the x and y co-ordinate of the ball in the frame, and the Distance of the ball calculated using the method discussed in the openCV section of the report.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_ROSin.png"/>  
</p>
[Link to code](https://github.com/AandJ/ROCO224/blob/master/CODE/MATLAB/openCV_in.m)  

## Inverse Kinematic solver
To perform our inverse kinematics we created two functions both using the `SerialLink.ikine(q, options)` command, we created two as we wanted one for Cartesian control in which we would feed an x y and z co-ordinate and it would move to that position with the gripper facing down, and another which would be fed a full homogeneous transform for a position we would like it to to move to. both used the mask matrix [1 1 1 0 0 1] which masked the Rx and Ry component of the transforms, this is because our arm does not have a spherical wrist and con only rotate around 1 axis (Rz).  
The first solver used for non Cartesian control used the commands.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/IKINE_FUNCTION_1.png"/>  
</p>
[Link to code](https://github.com/AandJ/ROCO224/blob/master/CODE/MATLAB/NON_masked_IKINE.m)  
The second function that is used for Cartesian control used the commands.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/IKINE_FUNCTION_2.png"/>  
</p>
[Link to code](https://github.com/AandJ/ROCO224/blob/master/CODE/MATLAB/Inverse_Kinematics.m)  

## TO_BALL function
We needed a way to approach the ball, for this we needed a way to know where the ball is relative to the arm. We took the values returned from the function openCV_in.m and looked at the x and y position to see if they were greater or less than 0, for x_off we modified the base servo position until it was within a 50 pixel region along the x axis in the frame, we then modified the Gripper tilt until the ball was withing a 50 pixel region on the y axis in the frame. Now we had to approach the ball, to do this we used the distance value and created a transform from the gripper to the ball, in this transform we accounted for the offsets from the camera to the gripper, we then performed forward kinematics to get the transform from the base to the gripper and multiplied this by our transform from the gripper to the ball, we then used our non masked inverse kinematic solver to obtain the joint positions to achieve this new end effector position.  
<p align="">
First section of code to move gripper to face ball.  
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_TO_BALL_1.png"/>  
Second section of code calculated transform to move foward to the ball.  
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_TO_BALL_2.png"/>  
</p>
[Link to code](https://github.com/AandJ/ROCO224/blob/master/CODE/MATLAB/TO_BALL.m)  

## Main loop - ARM_CONTROL.m
The main loop of the code describes the robot and initialises ROS, it also controls the simulation of the robot and the sequence in which functions are called. The first action this code had to perform was initialisation of the ROS node and setting the initial variables including the robot description, once this had been done the code told the robot to move to its start position.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Simulated_startPOS.png"/>  
</p>
We then entered the TO_BALL() function which had our arm track the red balls and move to pick it up, once this function returned the arm had moved to grab the ball, the function returned the new joint values which we then used to perform inverse kinematics to move the arm to be above the center of the workspace, we then moved above the bowl/container and opened the gripper to drop the ball, the final action was to return to its start position and loop back to the begining of the code to continue to track red balls.  
<p align="">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/ARM_CONTROL.png"/>  
</p>
[Link to code](https://github.com/AandJ/ROCO224/blob/master/CODE/MATLAB/ARM_CONTROL.m)  

## Video
Now that we had all the necasary code we could test our arm, we decided to test with two balls as this would confirm that the code was repeatable and could handle a situation were multiple balls were detected.  
<a href="https://www.youtube.com/watch?v=JnmU-MjMiM0" target="_blank"><img src="http://img.youtube.com/vi/JnmU-MjMiM0/0.jpg" alt="Test of arm" width="640" height="360" border="0" /></a>  

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
[Analysis of Arm](https://github.com/AandJ/ROCO224/blob/master/ArmAnalysis.md)  
***
[Kinematics](https://github.com/AandJ/ROCO224/blob/master/kinematics.md)  
***
[openCV - object tracking](https://github.com/AandJ/ROCO224/blob/master/openCV.md)  
***
[DECODER](https://github.com/AandJ/ROCO224/blob/master/Decoder.md)  
***
__MATLAB__  
***
[Visual Components Simulation](https://github.com/AandJ/ROCO224/blob/master/VCS.md)  
