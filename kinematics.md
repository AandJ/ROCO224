# Kinematics of Arm

## Introductions
Calculation of the Kinematics is essential for controlling the robot, the transform functions describe the relationship between the frames for each LINK, these can then be used in the forward kinematics which allows us to work out the exact position and orientation of the end effector. The inverse kinematics is the most use full allowing us to calculate the needed joint angles to put the end effector in a specific position.  

## Transform functions
To get the transform functions for our arm we used the Denavit–Hartenberg parameters.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Transforms.PNG"/>  
</p>
Now that we had our transform functions we wanted to check if these where correct, to do this we used the rvc (Robotics, Vision and Control) toolbox in MATLAB.  
We did this by using the "link" type classification and the SerialLink command to describe our robots parameters, we then used SerialLink.plot and SerialLink.animate to create a graphical representation of our robots kinematics. This is shown below.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Matlab_Kinetic_sim.gif"/>  
</p>

## Forward kinematics
To obtain the forward kinematics we need to times all the transform function together, this allows us to work out the position of the end effector frame at the current joint positions. To do this we times together the transform functions. This however can be long and tedious to do, this is why we use one of the MATLAB commands to perform the forward kinematics for us, this is the "SerialLink.fkine" command. `FwrdKin = R.fkine(JOINTS);` would determine the position of the end effector for the joint states specified by the "JOINTS" variable. We decided to test this command by inputting the joint states into the matrix we calculated by multiply our transform function and comparing the result to that of the MATLAB commands.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/FWRDKIN_1.png"/>  

This left us the results  

<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/FWRDKIN_2.png"/>  
</p>
From this we can see the results we calculated are the same as the result from using the MATLAB command.  

## Inverse kinematics - Inverse kinematics by optimisation without joint limits
We wanted to perform Inverse kinematics so that our arm can move to a specific position.  
The inverse kinematics for our arm was made more complicated due to the design not having a wrist, this meant the arm was under actuated and so its end effector Rx and Ry components were set by its position and could not be modified. To overcome this issue we used a MATLAB inverse kinematic solver that would mask out these components. The command we used was `SerialLink.ikine(q, options)` also called "Inverse kinematics by optimisation without joint limits" we used several of the options to get this to function for our design, the most important was the mask, this allowed us to mask the unnecessary components of the transform, we also used the options "verbose" "slimit" and "q0".  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Matlab_IKINE.png"/>  
</p>

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
[Analysis of Arm](https://github.com/AandJ/ROCO224/blob/master/ArmAnalysis.md)  
***
__Kinematics__  
***
[openCV - object tracking](https://github.com/AandJ/ROCO224/blob/master/openCV.md)  
***
[DECODER](https://github.com/AandJ/ROCO224/blob/master/Decoder.md)  
***
[MATLAB](https://github.com/AandJ/ROCO224/blob/master/MATLAB.md)  
***
[Testing](https://github.com/AandJ/ROCO224/blob/master/Testing.md)  
***
[Visual Components Simulation](https://github.com/AandJ/ROCO224/blob/master/VCS.md)  
