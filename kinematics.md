# Kinematics of Arm

## Introduction
Calculation of the Kinematics is essential for controlling the robot, the transform functions describe the relationship between the frames for each LINK, these can then be used in the forward kinematics which allows us to work out the exact position and orientation of the end effector. The inverse kinematics is the most use full allowing us to calculate the needed joint angles to put the end effector in a specific position.  

## Transform functions
To get the transform functions for our arm we used the Denavit–Hartenberg parameters.  
<p align="center">
![Image of maths](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Transforms.PNG "Image of maths")  
</p>
Now that we had our transform functions we wanted to check if these where correct, to do this we used the rvc (Robotics, Vision and Control) toolbox in MATLAB.  
We did this by using the "link" type classification and the SerialLink command to describe our robots parameters, we then used SerialLink.plot and SerialLink.animate to create a graphical representation of our robots kinematics. This is shown below.  
<p align="center">
![GIF of Kinematic SIM](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Matlab_Kinetic_sim.gif "GIF of Kinematic SIM")  
</p>

## Forward kinematics
To obtain the forward kinematics we need to times all the transform function together, this allows us to work out the position of the end effector frame at the current joint positions.
This can be done in MATLAB using the "SerialLink.fkine" command. `FwrdKin = R.fkine(JOINTS);` would determine the position of the end effector for the joint states specified by the "JOINTS" variable.  

## Inverse kinematics

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
[Analysis of Arm](https://github.com/AandJ/ROCO224/blob/master/ArmAnalysis.md)  
***
__Kinematics__
***
[To be added later](https://github.com/AandJ/ROCO224/blob/master/NAME.md)  
