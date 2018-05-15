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
	Gripper = JOINT[4]

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

#Note test with que size 0
pub_BASE = rospy.Publisher('BASE_controller/command', Float64, queue_size=0)
pub_dual_motor = rospy.Publisher('dual_motor_controller/command', Float64, queue_size=0)
pub_joint2 = rospy.Publisher('joint2_controller/command', Float64, queue_size=0)
pub_GripperTilt = rospy.Publisher('GripperTilt_controller/command', Float64, queue_size=0)
pub_Gripper = rospy.Publisher('Gripper_controller/command', Float64, queue_size=0)

# Initialise ROS node and subscribe to /MATLAB topic
rospy.init_node('decoder', anonymous=True)
rospy.Subscriber('/MATLAB', Float64MultiArray, callback)

# Enter main loop
if __name__ == '__main__':
    main()
	

	

	
