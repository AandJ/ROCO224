%Describe our ROBOT parameters using DEVAVIT_HARTENBERG parameters
L(1) = Revolute('d', 50, 'a', 0, 'alpha', pi/2);
L(2) = Revolute('d', 0, 'a', 195, 'alpha', 0);
L(3) = Revolute('d', 0, 'a', 186, 'alpha', 0);
L(4) = Revolute('d', 0, 'a', 199.5, 'alpha', 0);
%Use serial link to create the ROBOT model
R = SerialLink(L, 'name', 'Armatha Christie');

%Check if ROS global node running, if not init ROS
if robotics.ros.internal.Global.isNodeActive == 0
    rosinit;
end

%Set initial joint states and plot the robot
Current_Joints = [0 pi/4 pi/1.5 pi/2];
R.plot(Current_Joints)
axis([-500 500 -500 500 -200 600])

R.fkine(Current_Joints)

%Output the desired Joint positions via ROS
ROS_out(Current_Joints,0);

pause(3);
while true
    %Move end effector to grab the ball and return current joint states
    Current_Joints = TO_BALL(R,Current_Joints);

    pause(1);

    %Move to centre position
    Current_Joints = Inverse_Kinematics(R,-200,0,20,Current_Joints);
    R.animate(Current_Joints)
    ROS_out(Current_Joints,0)
    
    pause(2);
    
    %Move to bowl position
    Current_Joints = Inverse_Kinematics(R,-100,-120,100,[0 pi/4 pi/1.5 pi/2]);
    R.animate(Current_Joints)
    ROS_out(Current_Joints,0)

    pause(4);

    ROS_out(Current_Joints,1)

    pause(3);

    %return to initial joint states and plot the robot
    Current_Joints = [0 pi/4 pi/1.5 pi/2];
    R.animate(Current_Joints)
    ROS_out(Current_Joints,0)

    pause(1);
end
rosshutdown