function [Current_Joints] = TO_BALL(robot,Current_Joints)
%TO_BALL function uses openCV node and moves camera to appraoch ball
while true   
    [x_off,y_off,Distance] = openCV_in();
        
    %Center x and y co-ordinates, camera is 640x480
    x_off = x_off - 320;
    y_off = y_off - 240;
    
    %Move to center ball on Y axis
    if x_off > 25
        if x_off < 100
            Current_Joints(1,1) = Current_Joints(1,1)-0.01;
        else
            Current_Joints(1,1) = Current_Joints(1,1)-(x_off/5000);
        end
    else
    if x_off < -25
        if x_off > -100
            Current_Joints(1,1) = Current_Joints(1,1)+0.01;
        else
            Current_Joints(1,1) = Current_Joints(1,1)-(x_off/5000);
        end
    end
    end
    
    %Move to center ball on X axis
    if y_off > 25
        if y_off < 100
            Current_Joints(1,4) = Current_Joints(1,4)+0.01;
        else
            Current_Joints(1,4) = Current_Joints(1,4)+(y_off/5000);
        end
    else
    if y_off < -25
        if y_off > -100
            Current_Joints(1,4) = Current_Joints(1,4)-0.01;
        else
            Current_Joints(1,4) = Current_Joints(1,4)+(y_off/5000);
        end
    end
    end
    
    if (-25 <= x_off) && (x_off <= 25) && (-25 <= y_off) && (x_off <= 25) 
        if Distance > 10
            %Get Closer to ball
            FWRDKIN = robot.fkine(Current_Joints);
            %Extract matrix from SE3 class returned by fkine command
            Current_POS_Matrix = FWRDKIN.T;
            %Set distance needed to travel and account for offset of camera
            SHIFT_Matrix = [1 0 0 (Distance-160) ; 0 1 0 -100 ; 0 0 1 0 ; 0 0 0 1];
            %Off set X component to move end effector in direction it is facing
            New_POS_Matrix = Current_POS_Matrix * SHIFT_Matrix;
            %Use non masked IKINE solver to move foward
            Current_Joints = NON_masked_IKINE(robot,New_POS_Matrix,Current_Joints);
            
            [X, Y, Z] = TO_Cartesian(robot,Current_Joints);
            Current_Joints = Inverse_Kinematics(robot,X,Y,-30,Current_Joints);

            %Output the desired Joint positions via ROS with gripper open
            ROS_out(Current_Joints,1);
            
            pause(4);

            %Lower to ball
            Current_Joints = Inverse_Kinematics(robot,X,Y,-80,Current_Joints);
            ROS_out(Current_Joints,1);

            pause(1);

            %Close Gripper
            ROS_out(Current_Joints,0);
            
            robot.animate(Current_Joints)
            pause(1);
            fprintf('Exiting TO_BALL\n')
            return
        else
            fprintf('Exiting TO_BALL() with error\n')
            return
        end 
    end
    robot.animate(Current_Joints)
    %Output the desired Joint positions via ROS
    ROS_out(Current_Joints,0);
    
end