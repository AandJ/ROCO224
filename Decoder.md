# Decoder 

Our code for the decoder needs to subscribe to the topic MATLAB publishes to, this is so it can read the desired servo position MATLAB has calculated, it then sends these positions to the servo. We used this method because MATLAB takes a long time to output data to ROS and it was quicker for MATLAB to publish one array of 5 values than 5 individual values, this allows MATLAB to run faster whilst this node runs in the background sending each component of the array recieved from MATLAB to the necacary servos  

```python
#!/usr/bin/env python

# Import libaries
import rospy
import roslib
from std_msgs.msg import Float64
from std_msgs.msg import Float64MultiArray

#Callback to be triggered every time something is published to MATLAB topic
def callback(data):
	JOINT = data.data
	BASE = JOINT[0]
	dual_motor = JOINT[1]
	joint2 = JOINT[2]
	GripperTilt = JOINT[3]
	Gripper = 0

	pub_BASE.publish(BASE)
	pub_dual_motor.publish(dual_motor)
	pub_joint2.publish(joint2)
	pub_GripperTilt.publish(GripperTilt)
	pub_Gripper.publish(Gripper)

# Main loop
def main():
	while 1:
		rospy.spin()

# Set up ROS publishers
pub_BASE = rospy.Publisher('BASE_controller/command', Float64, queue_size=1)
pub_dual_motor = rospy.Publisher('dual_motor_controller/command', Float64, queue_size=1)
pub_joint2 = rospy.Publisher('joint2_controller/command', Float64, queue_size=1)
pub_GripperTilt = rospy.Publisher('GripperTilt_controller/command', Float64, queue_size=1)
pub_Gripper = rospy.Publisher('Gripper_controller/command', Float64, queue_size=1)

# Initialise ROS node and subscribe to /MATLAB topic
rospy.init_node('decoder', anonymous=True)
rospy.Subscriber('/MATLAB', Float64MultiArray, callback)

# Enter main loop
if __name__ == '__main__':
    main()
```

## Navigation
[Project Introduction](https://github.com/AandJ/ROCO224/blob/master/ProjectIntroduction.md)  
***
[Arm Design](https://github.com/AandJ/ROCO224/blob/master/ArmDesign.md)  
***
[Analysis of Arm](https://github.com/AandJ/ROCO224/blob/master/ArmAnalysis.md)  
***
[Kinematics](https://github.com/AandJ/ROCO224/blob/master/kinematics.md)  
***
[openCV](https://github.com/AandJ/ROCO224/blob/master/openCV.md)  
***
__DECODER__
***
[MATLAB](https://github.com/AandJ/ROCO224/blob/master/MATLAB.md)  

