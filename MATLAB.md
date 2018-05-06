# MATLAB

## Inverse Kinematic solver
To perform our inverse kinematics we created two functions both using the `SerialLink.ikine(q, options)` command, we created two as we wanted one for Cartesian control in which we would feed an x y and z co-ordinate and it would move to that position with the gripper facing down, and another which would be fed a full homogeneous transform for a position we would like it to to move to. both used the mask matrix [1 1 1 0 0 1] which masked the Rx and Ry component of the transforms, this is because our arm does not have a spherical wrist and con only rotate around 1 axis (Rz).  
The first solver used for non Cartesian control used the commands.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/IKINE_FUNCTION_1.png"/>  
</p>
The second function that is used for Cartesian control used the commands.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/IKINE_FUNCTION_2.png"/>  
</p>

## TO_BALL function
We needed a way to approach the ball, for this we needed a way to know where the ball is relative to the arm. We wrote a function that subscribed to the openCV topic to read the x y position of the ball and its radius, we then converted the radius to distance using the equation.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/DistanceEQ.PNG"/>  
</p>
We took the x and y position and checked to see if they were greater or less than 0, for x_off we modified the base servo position until it was within a 50 pixel region along the x axis in the frame, we then modified the Gripper tilt until the ball was withing a 50 pixel region on the y axis in the frame. Now we had to approach the ball, to do this we used the distance value and created a transform from the gripper to the ball, in this transform we accounted for the offsets from the camera to the gripper, we then performed forward kinematics to get the transform from the base to the gripper and multiplied this by our transform from the gripper to the ball, we then used our non masked inverse kinematic solver to obtain the joint positions to achieve this new end effector position.  
<p align="">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_TO_BALL_1.png"/>  
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_TO_BALL_2.png"/>  
</p>

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
[Analysis of Arm](https://github.com/AandJ/ROCO224/blob/master/ArmAnalysis.md)  
***
[Kinematics](https://github.com/AandJ/ROCO224/blob/master/kinematics.md)  
***
[openCV](https://github.com/AandJ/ROCO224/blob/master/openCV.md)  
***
[DECODER](https://github.com/AandJ/ROCO224/blob/master/Decoder.md)  
***
__MATLAB__  
