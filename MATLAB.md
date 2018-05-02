# MATLAB

## TO_BALL function
We needed a way to approach the ball whilst tracking it, to do this we iterate towards the ball by simply observing it with the camera and using the values fed back from openCV (The x,y and radius of the ball) to move either left or right and up or down until we were looking at the ball. To move left and right we either incremented or decremented the value sent to the servo for base rotation, to move up and down we simply changed the value for Gripper Tilt. once the balls center was withing a 50 pixel large area around the center of the camera we performed forward kinematics, we then incremented the X component of this Transform which told our arm to move the gripper in the way it was facing, to do the inverse kinematics for the new position we used the command we talked about in the section on kinematics (the `SerialLink.ikunc(T, Q0, Options)` command). This allowed us to have our gripper approach the ball, it would continue to poll the X and Y co ordinate of the ball to see if it left the 50 pixel area and would re align if it did, once the radius of the ball exceeded 140 pixels, calculated to be approx ??M, the gripper would stop and move on to the next section.  
We put this process in a function called TO_BALL(), this is shown below.  
<p align="left">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_TO_BALL.png"/>  
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MATLAB_TO_BALL.png"/>  
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
