function [] = ROS_out(Joints,Gripper)
%Function publishes input 'Joints'and 'Gripper' to ROS topic '/MATLAB' ROS
%uses python decoder node to set joints of arm to input 'Joints' and
%gripper open if input 'Gripper' is 1

ROS_OUT = rospublisher('/MATLAB', 'std_msgs/Float64MultiArray');

%Account for Joint offsets in sim
Joints(1,1) = Joints(1,1);
Joints(1,2) = Joints(1,2)-(pi/2)+(pi*0.20);
Joints(1,3) = -Joints(1,3)+(pi*0.20);
Joints(1,4) = Joints(1,4)+(pi*0.1);

%Add Gripper value to matrix
Joints(1,5) = Gripper;

JOINT_STATES = rosmessage(ROS_OUT);
JOINT_STATES.Data = Joints;

for i = 0:0.1:2
    %Publish desired joint states
    send(ROS_OUT,JOINT_STATES);
    pause(0.01);
end
end