# Programming industrial robots  

## Introduction  

The robotic arm that we used for both our real and simulated robot is the Mitsubishi RV-2AJ which has 5 DoF (Degrees of freedom) and a degree of freedom for wrist movement. This allows it to be able to easily complete the task of picking up Lego bricks and moving them to a different position on the base board as long as the board has been placed appropriately at the start. We used this arm to both pick up 4 bricks and build a tower out of them with the real arm as well as simulating the arm to move eight bricks. These 8 bricks were to be moved from one side of the Duplo board to the other from set starting and finishing positions and had to be moved across by going through a gate in the centre of the board at a constant height. We completed this simulation using Visual components which allowed us to import a template of the Mitsubishi arm along with the Duplo bricks and board.  

## Relevance  

A good reason to simulate the operation of the industrial arm is so that you can test if the industrial arm will be able to complete a task without having to take time to manually set things up to find that it won’t work. It also means that the arm isn’t put in danger of being damaged as the simulation would show when the arm reached its maximum joint angles or when it would collide with something in real life. As the simulation is much simpler to set up it means that is can be set up quickly and potentially save time that could be wasted if trying to run the arm without simulating first.  

To control the real arm, it can either be controlled manually or by running a program. The programs it can run are written in MELFA Basic where joints and positions can be defined and then a set of instructions can tell the arm how to move between these position as well as control the arm’s gripper. The positions/joints in the MELFA Basic file can either be manually written into the file or imported from a .POS file which can take teach points to save positions the arm has been left in by the user using the teach pendant.  

The simulated robot is controlled by dragging the robot to the position you want it to go to or by snapping the gripper to where you want it to be, the robot can then be set to go generally to that point or in a linear direction to that position. The simulation is much quicker to program with as it takes much less time to put the robot into the positions you want as well as allowing for sequences to be called to run the same sequence of movements multiple times without having to re-add the positions. The simulation can also have IF and WHILE loops meaning that if a group of movements need to be done multiple times then they don’t need to be re-added each time.  

## Development  

We delegated the work by having a pair work on the real arm while the other pair worked on the simulation. When we encountered problems we discussed them as a group and suggested solutions and more appropriate functions in the software, for example using offset positions instead of setting each position through the teach point.  

A problem we experienced was due to the limited reach of the arm where the arm met a point of singularity and so was unable to reach the edge of the board for the final position. We solved this problem by changing the starting position to one within the arm’s range. This taught us to first check the arm’s range in comparison to both our starting and finishing positions before programming. Another issue we encountered was the arm phasing through the gate when we programmed in the code from snapping the gripper to the blocks since there was no collision detection. To fix this we had to set positions above the blocks, so the arm would first move there and avoid colliding with the gate.  

We were unable to snap the blocks to the board due to the board’s studs did not align up with the bottom of the blocks. Therefore, to set the starting position we aligned the blocks to the board using the aligning tool and moved the into the correct position.  

<p align="center">
<img src="https://user-images.githubusercontent.com/32440660/40085523-acf4d702-5892-11e8-87fd-36319d3a04fd.png" height="200"/> <img src="https://user-images.githubusercontent.com/32440660/40085952-38bb41ee-5894-11e8-89cc-482f7b49b678.JPG" height="200"/>
</p>




## Results  

We were able to program the arm to simulate moving all the blocks from initial position 10 to final position 1, passing through the gate at the same height each time. We managed this through calling set sequences from the main sequence which were programmed with the gate pass positions, one sequence for each direction. We snapped the gripper to the blocks and set the position in the code and then moved the arm along its Cartesian axis to get the position ‘Block1’ and ‘Block1Up’. We then closed the gripping after the snapped position by setting the output to ‘OUT[1] == True’.  

<p align="center">
<img src="https://user-images.githubusercontent.com/32440660/40086144-0a77d936-5895-11e8-9160-f53d02a27fa1.JPG" height="200"/> <img src="https://user-images.githubusercontent.com/32440660/40086191-354756b4-5895-11e8-9cc8-1c33a8308c9e.JPG" height="200"/>
</p>
<p align="center">
<img src="https://user-images.githubusercontent.com/32440660/40086243-7a5e2962-5895-11e8-89cd-5cd645036fa9.JPG" height="200"/>
</p>   

An error we encountered was the arm simulating an unprogrammed movement in the middle of our sequence which we believe is due to the arm not being able to move to the blocks position directly from where it was. This is most likely due to there being a point of singularity between the two programmed positions, so the arm diverts itself around to the block. The sequence still fulfills its task but with an unexpected movement.  

<p align="center">
<img src="https://user-images.githubusercontent.com/32440660/40086347-ee4b693e-5895-11e8-8587-4edcefe06fcf.gif" height="300"/>
</p>  

https://www.youtube.com/watch?v=xyaX2PG_Lb8&feature=youtu.be  

## Conclusion  

In conclusion despite the issues we encountered due the restriction of the arm’s range, which lead to changing our original starting and finishing position, we were able to solve all the problems encountered in order to complete the tasks. Using visual components, we programmed the arm using multiple sequences and the snap and alignment tools so that the code was effective as possible. We used MELFA basic to program the real arm while also using the teach pendent to set specific joint positions we needed. Overall, we familiarised ourselves with both the real and virtual arm and used both programming methods to complete both tasks.  

