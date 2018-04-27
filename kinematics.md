# Kinematics of Arm

## Introduction

## Transform functions
To get the transform functions for our arm we used the Denavit–Hartenberg parameters.  
![Image of maths](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Transforms.PNG "Image of maths")
Now that we had our transform functions we wanted to check if these where correct, to do this we used the rvc (Robotics, Vision and Control) toolbox in MATLAB.  
We did this by using the "link" type clasification and the SerialLink command to describe our robots parameters, we then used SerialLink.plot and SerialLink.animate to create a graphical representation of our robots kinematics. This is shown below.
![GIF of Kinematic SIM](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Matlab_Kinetic_sim.gif "GIF of Kinematic SIM")

## Foward kinematics
To obatin the foward kinematics we need to times all the transform function together, this allows us to work out the position of the end effector frame at the current joint positions.

## Inverse kinematics

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
[Analysis of Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)    
***
__Kinematics__
***
[To be added later](https://github.com/AandJ/ROCO224/blob/master/NAME.md)  
