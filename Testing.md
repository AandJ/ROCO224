# Testing 

## Test 1 - basic function
The first test we conducted was a basic test of the arms function, we had the arm track and attempt to pick up a single red ball with no other objects in view, the video of this test is linked below.  
<p align="center">
<a href="https://www.youtube.com/watch?v=m9dE5i0sFgM" target="_blank"><img src="http://img.youtube.com/vi/m9dE5i0sFgM/0.jpg" alt="Test 1" width="640" height="360" border="0" /></a>  
</p>
The test failed as the gripper was loose and the ball was able to roll out, we fixed this by adding an elastic band around the top of the claws to keep then together, this made the gripper tight enough that the ball could not roll out. This test confirmed the arm can locate the balls and reaching for them.  

## Test 2 - Real world situtation
The second test we conducted tested the arm under a real-world problem were multiple object were visible, this allowed us to see if the arm would isolate the one of the ones we wanted, we also added a second red ball to check that the arm would decide on which ball to go for and the second ball would not interfere, the video of this test is linked below.  
<p align="center">
<a href="https://www.youtube.com/watch?v=BM8-6rLjCj0" target="_blank"><img src="http://img.youtube.com/vi/BM8-6rLjCj0/0.jpg" alt="Test 2" width="640" height="360" border="0" /></a>  
</p>
This test failed because of what we think is a bug in the MATLAB ROS toolbox, we found that when we used the command to publish to a topic in MATLAB that the data was not always published, we resolved this as mentioned in the section ROS publisher by having the send command looped multiple times to guarantee the data was published. This test however did confirm that the arm can isolate the object we desire as it only reached for the red ball and ignored all other objects in view.  

## Test 3 - Full operation
For our third test we decided to use two balls as this would confirm that the code was repeatable and could handle a situation where multiple balls were detected, the video of this test is linked below.  
<p align="center">
<a href="https://www.youtube.com/watch?v=JnmU-MjMiM0" target="_blank"><img src="http://img.youtube.com/vi/JnmU-MjMiM0/0.jpg" alt="Test 3" width="640" height="360" border="0" /></a>  
</p>
This test was successful as we can see the arm grabs both red balls in view and places them in the container, the arm ignores all other objects confirming its ball detection is working as it should, we also see the gripper lower down onto the balls confirming the inverse kinematics of the arm is functioning properly.  

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
[MATLAB](https://github.com/AandJ/ROCO224/blob/master/MATLAB.md)  
***
__Testing__
***
[Visual Components Simulation](https://github.com/AandJ/ROCO224/blob/master/VCS.md)  
