# Design of Arm  

## Introduction 
 
Our Project introductions states that we will make an arm capable of picking up balls, to do this we need our gripper to be able to change its approach angle so we need at least 4 DOFs'. Since we were provided with 7 servos (one of which is required for the gripper) we decided to make an arm with exactly 4 degrees of freedom using two motors for the first limb to guarantee it will be able to support the maximum load.  
We also decided to have as much of our arm laser cut to reduce production time and cost.  

## Base

The base will be comprised of many bodies, a base lower, a base upper, and the supports to connect the two. The base upper will need to connect the first servo which will provide base rotation to the Base rotation plate.  

In base upper we can see that it has a cutout with screw holes to connect the servo which will sit underneath the base upper body. We also see the cutouts for the supports.  
The base lower is the same size as base upper but without the cutout for a servo, we can see this has support cutouts to mirror base upper.  
The 13 supports are identical rectangular beams which connect into the cutouts of base upper and base lower. I used the circular pattern tool to get even spacing between the supports.  
Below is an screen shot of the assembled base in fusion 360.  

<p align="center">
![Image of BASE](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Base.PNG "Image of BASE")  
</p>

## Base rotation plate

The base rotation plate sits above the base and is rotated by the servo fitted to the base, this then connects to the servos that move the first limb of the robot, since this component needs to connect to two servos we decided to 3D print as it would allows us a more complex shape.  

<p align="center">
![Image of base rotation plate](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Base_ROTPlate.PNG "Image of base rotation plate")  
</p>

## 1st Limb

The first limb consists of 3 bodies, two large bodies and a structural support to connect them and reduce any torsion it may experience.  
The distance between the pivots for this limb is 195mm  

<p align="center">
![Image of 1st limb](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/LIMB1.PNG "Image of 1st limb")  
</p>

## 2nd Limb

The second limb attached directly after the first limb has two servos one to move itself and one to move the gripper attacher.  
The distance between the pivots for this limb is 186mm  

<p align="center">
![Image of second limb](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/LIMB2.PNG "Image of second limb")
</p>

## Gripper Attacher

The gripper attacher connects to the end of the limb two and allows us to change the approach angle of the gripper.  

<p align="center">
![Image of gripper attacher](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/Gripper_Attacher.PNG "Image of gripper attacher")  
</p>

The gripper attacher is also where the component holding the camera will be connected, for the camera we decided to re purpose one of the heads from the robot football players and utilise its built in camera for our visual tracking. The head that will be attached to this components is shown below.  

<p align="center">
![Image of HEAD](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/HEAD.PNG "Image of HEAD")  
</p>

## Gripper

We decided on using 3 prongs rather than 2 as this would provide a better grip for the balls which we intend on coding the arm to collect.  
To accomplish this we needed a mechanical system that would allow one servo to rotate 3 gears at 120 degree angles to each other. To achieve this we decided to use a rack and pinion system.  
Due to the complexity of this components we had to 3D print.  

Below is an image of the rack and pinion system we designed in fusion.  

<p align="center">
![Image of rack and pinion](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/RackAndPinion.PNG "Image of rack and pinion")  
</p>

this will be fitted to the main gripper case which will then attach to the gripper attacher. The gripper case needed to hold all the gears whilst allowing them to rotate freely, We decided to attach one gear directly to the servo which would then be held by the gripper case, this is shown in the image below.  

<p align="center">
![Image of gripper structure](https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/GripperStructure.PNG "Image of gripper structure")  
</p>

## Full Design

<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/FULL.PNG"/> <img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/FULL_animated.gif" height="668"/>  
</p>

## Later Modifications
We modified several parts of our design to account for issues that arrose, this includes.
* Removal of the outer layer of the head to reduce torque on servos.
* Addition of a drive stabaliser to stop the drive in the gripper from tilting.
* Addition of a deep groove axial bearing between the Base and the BaseROT component to reduce rotational stress.

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
__Arm Design__  
***
[Analysis of Arm](https://github.com/AandJ/ROCO224/blob/master/ArmAnalysis.md)  
***
[Kinematics](https://github.com/AandJ/ROCO224/blob/master/kinematics.md)  
***
[To be added later](https://github.com/AandJ/ROCO224/blob/master/NAME.md)  

