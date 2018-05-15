#!/usr/bin/env python

# import the necessary packages
import rospy
import roslib
from collections import deque
from std_msgs.msg import Float64MultiArray
import numpy as np
import cv2

def nothing(x):
	pass

#cv2.namedWindow("trackbar window")

#cv2.createTrackbar("Hmin","trackbar window",0,180,nothing)
#cv2.createTrackbar("Hmax","trackbar window",180,180,nothing)
#cv2.createTrackbar("Smin","trackbar window",180,255,nothing)
#cv2.createTrackbar("Smax","trackbar window",255,255,nothing)
#cv2.createTrackbar("Vmin","trackbar window",120,255,nothing)
#cv2.createTrackbar("Vmax","trackbar window",255,255,nothing)
#cv2.createTrackbar("Bmin","trackbar window",0,255,nothing)
#cv2.createTrackbar("Bmax","trackbar window",255,255,nothing)
#cv2.createTrackbar("Gmin","trackbar window",0,255,nothing)
#cv2.createTrackbar("Gmax","trackbar window",255,255,nothing)
#cv2.createTrackbar("Rmin","trackbar window",0,255,nothing)
#cv2.createTrackbar("Rmax","trackbar window",255,255,nothing)
#cv2.createTrackbar("BLUR","trackbar window",11,100,nothing)

#webcam
camera = cv2.VideoCapture(1)

#ROS
pub_openCV = rospy.Publisher('/openCV', Float64MultiArray, queue_size=1)
rospy.init_node('openCV', anonymous=True)
rate = rospy.Rate(30)

def main():
	# keep looping
	while True:
		## grab the current frame
		(grabbed, frame) = camera.read()
 
		# Blur the frame and create a copy in HSV color space
		blurred = cv2.medianBlur(frame, 11, 0)
		HSV = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
 	
		#Get values from track sliders
		#HMIN = cv2.getTrackbarPos("Hmin","trackbar window")
		#HMAX = cv2.getTrackbarPos("Hmax","trackbar window")
		#SMIN = cv2.getTrackbarPos("Smin","trackbar window")
		#SMAX = cv2.getTrackbarPos("Smax","trackbar window")
		#VMIN = cv2.getTrackbarPos("Vmin","trackbar window")
		#VMAX = cv2.getTrackbarPos("Vmax","trackbar window")
		#lowerHSV = (HMIN,SMIN,VMIN)
		#upperHSV = (HMAX,SMAX,VMAX)
		#RMIN = cv2.getTrackbarPos("Rmin","trackbar window")
		#RMAX = cv2.getTrackbarPos("Rmax","trackbar window")
		#GMIN = cv2.getTrackbarPos("Gmin","trackbar window")
		#GMAX = cv2.getTrackbarPos("Gmax","trackbar window")
		#BMIN = cv2.getTrackbarPos("Bmin","trackbar window")
		#BMAX = cv2.getTrackbarPos("Bmax","trackbar window")
		#lowerBGR = (BMIN,GMIN,RMIN)
		#upperBGR = (BMAX,GMAX,RMAX)
		#Blur = cv2.getTrackbarPos("BLUR","trackbar window")

		# define the lower and upper boundaries of the colors
		HSVLower = (0, 180, 120)
		HSVUpper = (10, 255, 255)
		BGRLower = (0, 0, 120)
		BGRUpper = (40, 80, 255)

		# construct a mask for the color then perform
		# a series of dilations and erosions to remove any small
		# blobs left in the mask
		HSV_mask = cv2.inRange(HSV, HSVLower, HSVUpper)
		BGR_mask = cv2.inRange(blurred, BGRLower, BGRUpper)

		# Combine masks
		mask = cv2.bitwise_and(HSV_mask,BGR_mask)

		# Blur again
		blurred = cv2.medianBlur(mask, 11, 0)

		mask = cv2.erode(mask, None, iterations=2)
		mask = cv2.dilate(mask, None, iterations=2)
	
		# Search for red balls

		# find contours in the mask and initialize the current
		# (x, y) center of the ball
		contours = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL,
			cv2.CHAIN_APPROX_SIMPLE)[-2]
		center_= None
 	
		# only proceed if at least one contour was found
		if len(contours) > 0:
			# set initial Euclidean distance
			stored_Euclidean_Distance = 10000
			radius_circle_stored = 0

			# For each contour found, check if circle
			for contour in range(len(contours)):
				c = contours[contour]
				((x, y), radius) = cv2.minEnclosingCircle(c)
				minEnclosingCircleArea = 3.1416*(radius**2)
				contourArea = cv2.contourArea(c)
				M = cv2.moments(c)
				center = (int(M["m10"] / M["m00"]), int(M["m01"] / M["m00"]))
 
				# only proceed if contour confirmed to be circle with radius greater than 25 pixels
				if ((0.7*minEnclosingCircleArea) < contourArea) and (radius > 25):
					# draw the circle and centroid on the frame
					cv2.circle(frame, (int(x), int(y)), int(radius),
						(0, 255, 255), 2)
					cv2.circle(frame, center, 5, (0, 0, 255), -1)
					# Check to see if circle is closer to center than the previous circle checked				
					X_calc = x - 320
					Y_calc = y - 240
					Euclidean_Distance = (X_calc**2 + Y_calc**2)**0.5
					if Euclidean_Distance < stored_Euclidean_Distance :
						stored_Euclidean_Distance = Euclidean_Distance						
						x_circle_stored = x
						y_circle_stored = y
						radius_circle_stored = radius
			
			# proceed only if a circle that met all conditions is found
			if (radius_circle_stored > 25) :
				print "X =", x_circle_stored, "    Y =", y_circle_stored, "    radius =", radius_circle_stored
				pos = Float64MultiArray()			
				pos.data = [x_circle_stored, y_circle_stored, radius_circle_stored]
				pub_openCV.publish(pos)

		# Display frame
		cv2.imshow("FRAME", frame)

		# Optional other displays
		#cv2.imshow("HSV",HSV)
		cv2.imshow("masked HSV", HSV_mask)
		cv2.imshow("masked BGR", BGR_mask)
		cv2.imshow("full mask", mask)
	 
		rate.sleep();

		# if the 'q' key is pressed, stop the loop
		key = cv2.waitKey(1) & 0xFF
		if key == ord("q"):
			break
 
	# cleanup the camera and close any open windows
	camera.release()
	cv2.destroyAllWindows()

# Start main loop
if __name__ == '__main__':
	main()
