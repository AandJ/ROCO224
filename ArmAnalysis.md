# Analysis of Arm

## Introduction

Now that the arm has been designed we will need to confirm whether thsi design meets its specification, to do this we need to confirm;  
* The arm is structuraly stong enough not to break while underload.  
* The torque on the servos at no piont exceeds the holding torque.  
* That the arm meets the pre set requirements in the coursework specification.  

## Structure (FEA)

To determine whether the design is structuraly sound we performed FEA (Force Effect Analysis) within fusion 360.  

## Torque

To determine whether the arm would be able to provide enough torque we performed some calculation, we assumed the arm was straight out at 180 degrees (maximum perpedicular distance) and under load (holding ball), we then added the torque from each component from the end of the gripper to the servo we where checking if at any point this is greater than the holding torque specified in the data sheet 5.66 N.cm (Stall torque = 25.6 N.cm) we can conclude the arm will not function. To perform these calculation we needed to know the Component weights, these are shown below.  
Servo = 73g ; Limb1 = ??g ; Limb2 = ??g ; GripperROT_Attacher = ??g ; HEAD = ??g : Gripper = ??g ; Ball = 3g  

## Specification

Our specification outlined what are arm needed to do, and now that we have confirmed the design is strong enough and can provide enough torque we can do this.  
* One   : Our arm must have atleast 5 DOFs' : Our arm uses exactly 5  
* Two   : Our arm will visualy track a Ball : Aplicatoin of re-cycled robot footballers head with contained camera  
* Three : The arm is structuraly strong enough : Confirmed above  
* Four  : The sevo can provide enoguh torque to lift the arm :Confirmed above  
From these we can confirm this design meets our requirements and can begin making the parts.  

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
__Structural Analysis of Arm__  
***
[To be added later](https://github.com/AandJ/ROCO224/blob/master/NAME.md)  
***
[To be added later](https://github.com/AandJ/ROCO224/blob/master/NAME.md)  

