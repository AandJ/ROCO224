function JOINTS = Inverse_Kinematics(robot,x,y,z,Current_Joints)

%This function performs inverse kinematics to move the end effector on
%robot specified by input 'robot' to specified 'x' 'y' and 'z' co-ordinates
%ignoring rotational x and y components. Initial condition is set by input
%'Current_Joints'
%
%Result always has gripper facing down.
%
%Example use : Joints = Inverse_kinematics(robot,x,y,z,Joints)

%Mask for X and Y rotational components
MASK = [1 1 1 0 0 1];
%New x y and z end effector co-ordinates, with gripper always facing down
NEWPOS = [0 1 0 x ; 0 0 -1 y ; -1 0 0 z ; 0 0 0 1];
%Perform invers kinematics to get desired joint states
JOINTS = robot.ikine(NEWPOS, 'mask', MASK, 'verbose', 'search', 'slimit', 10, 'q0', Current_Joints);

end