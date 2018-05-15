function [X, Y, Z] = TO_Cartesian(robot,Current_Joints)
%TO_CARTESIAN Summary of this function goes here
%   Detailed explanation goes here

FWRDKIN = robot.fkine(Current_Joints);
%Extract matrix from SE3 class returned by fkine command
Current_POS_Matrix = FWRDKIN.T;
X = Current_POS_Matrix(1,4);
Y = Current_POS_Matrix(2,4);
Z = Current_POS_Matrix(3,4);

end

