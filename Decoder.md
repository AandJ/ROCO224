# Decoder 

Our code for the decoder needs to subscribe to the topic MATLAB publishes to and out put the each component of the array MATLAB publishes to the correct servo, in this version of the code we control every thing except the gripper.
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
```

# Enter main loop
if __name__ == '__main__':
    main()

# Initial joint values
BASE = 0
dual_motor = 0
joint2 = 0
GripperTilt = 0
Gripper = 0

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

