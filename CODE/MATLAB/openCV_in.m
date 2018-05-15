function [x_off,y_off,Distance] = openCV_in()
%Function uses data from openCV node to calculate the position of tracked
%object relative to the camera of the robot, this is then returned to be
%used for inverse kinematics.

openCV = rossubscriber('/openCV', 'std_msgs/Float64MultiArray');

XYR = receive(openCV);
Data = XYR.Data;

x_off = Data(1,1);
y_off = Data(2,1);
radius = Data(3,1);

%Use equation to convert radius into distance account for offset
Distance = (35956.56 * radius^-1.179703);

end

