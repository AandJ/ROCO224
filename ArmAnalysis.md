# Analysis of Arm

## Introduction

Now that the arm has been designed we will need to confirm whether this design meets its specification, to do this we need to confirm;  
* The torque on the servos at no point exceeds the holding torque.  
* The arm is structurally Strong enough not to break while under load.  
* That the arm meets the pre set requirements in the coursework specification.  

## Torque

To determine whether the arm would be able to provide enough torque we performed some calculation, we assumed the arm was straight out at 180 degrees (maximum perpendicular distance) and under load (holding ball), we then added the torque from each component from the end of the gripper to the servo we where checking, if at any point this is greater than the holding torque specified in the data sheet 5.66 Kg.cm (Stall torque = 28.3Kg.cm) we can conclude the arm will strugle to function. To perform these calculation we needed to know the Components weights, these are shown below.  
Servo = 76g ; Limb1 = 54.2g ; Limb2 w/M = 201.7gg ; GripperROT_Attacher = 12.2g ; HEAD = 43g : Gripper = 57g ; Ball = 3g  

## Structure (FEA)

To determine whether the design is structurally sound we performed FEA (Finite Element Analysis) on the limbs within fusion 360.  
Using the free body diagrams we worked out the force that would act on the first and second limbs at there connection points, these came to 3.8543N for limb 1 and 2.6212N for limb 2. Because Our limb needs to be light, we decided that the minimum safety factor we would accept would be 1.6, meaning the arm could handle 1.6 times the maximum load, we decided this would be sufficient as it is unlikely the arms load will ever go over the theoretical maximum, and so long as the safety factor is above 1 it is sufficient to handle the theoretical maximum load.  

### Limb 1

Limb 1 will be under the most stress as it is has the most components connected above it, we calculated the maximum force to be 3.8543N and simulated this force on the design.  

<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/LIMB1_FEA.PNG"/>  
</p>

We can see that our resulting safety factor was 2.41, this is marked as yellow in fusion however is safe for our design, this is because this means the limb will not break until 2.41 times the maximum load.  

### Limb 2

We calculated the maximum force on limb 2 to be 2.6212N and simulated this force on the design.  

<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/LIMB2_FEA.PNG"/>  
</p>

We can see that our resulting safety factor was 15, which means the limb is safe for up to 15 times the maximum load which is easily within our desired boundaries. 

## Specification

Our specification outlined what are arm needed to do, and now that we have confirmed the design is strong enough and can provide enough torque we can do this.  
* One   : Our arm must have be able to pick up balls : Our arm has a 3 prong gripper to help in gripping spheres  
* Two   : Our arm will visually track a Ball : Application of re-cycled robot footballers head with contained camera  
* Three : The arm is structurally strong enough : Confirmed above  
* Four  : The servo can provide enough torque to lift the arm :Confirmed above  
From these we can confirm this design meets our requirements and can begin making and assembling the parts.  

<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/FULL_BUILT.PNG"/>  
</p>

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
__Analysis of Arm__  
***
[Kinematics](https://github.com/AandJ/ROCO224/blob/master/kinematics.md)  
***
[openCV](https://github.com/AandJ/ROCO224/blob/master/openCV.md)  
***
[DECODER](https://github.com/AandJ/ROCO224/blob/master/Decoder.md)  
***
[MATLAB](https://github.com/AandJ/ROCO224/blob/master/MATLAB.md)  

