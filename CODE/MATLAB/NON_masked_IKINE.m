function [JOINTS] = NON_masked_IKINE(robot,TRANSFORM,Current_Joints)

%This function performs inverse kinematics to move the end effector on
%robot specified by input 'robot' to specified 'x' 'y' and 'z' co-ordinates
%ignoring rotational x and y components. Initial condition is set by input
%'Current_Joints'
%
%Result always has gripper facing down.
%
%Example use : Joints = Iterative_IKINE(robot,T,Current_Joints)
%Where 'robot' is the robot on which the inverse kinematics are being
%performed, T is the transform for the desired new position, and
%'Current_Joints' is the current joint positions.

%Perform inverse kinematics to get desired joint states
%Mask for X and Y rotational components
MASK = [1 1 1 0 0 1];
%Perform invers kinematics to get desired joint states
JOINTS = robot.ikine(TRANSFORM, 'mask', MASK, 'verbose', 'search', 'slimit', 10, 'q0', Current_Joints);

end