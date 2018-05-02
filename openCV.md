# openCV

## Introduction 
OpenCV is a library of programming functions mainly aimed at real-time computer vision. We use these programs for locating the balls we wish to pick up and calculating their position relative to the arms camera. We decided to use python to code this node as we were more familiar with openCVs python commands.  

## The Code
the first thing we must do is obtain an image from the camera on the arm and convert it to HSV, we do this with the python commands.  
```python
## grab the current frame
(grabbed, frame) = camera.read()
 
# re size the frame, blur it, and convert it to the HSV
# colour space
frame = imutils.resize(frame, width=600)
blurred = cv2.GaussianBlur(frame, (11, 11), 0)
HSV = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV) 
```
Now that we have the HSV image we need to mask out all the data we don't want, for this we need to find the range of the Hue, Saturation and Value values for our ball. To determine these we created slider which we could modify until we had a black and white image in which the ball was shown as white with the rest of the image blacked out. The code for this is shown below.  
```python 
# Create window for sliders
cv2.namedWindow("trackbar window")

# Create sliders for all values
cv2.createTrackbar("Hmin","trackbar window",0,255,nothing)
cv2.createTrackbar("Hmax","trackbar window",255,255,nothing)
cv2.createTrackbar("Vmin","trackbar window",0,255,nothing)
cv2.createTrackbar("Vmax","trackbar window",255,255,nothing)
cv2.createTrackbar("Smin","trackbar window",0,255,nothing)
cv2.createTrackbar("Smax","trackbar window",255,255,nothing)

# Set values to current values on track bars
HMIN = cv2.getTrackbarPos("Hmin","trackbar window")
HMAX = cv2.getTrackbarPos("Hmax","trackbar window")
VMIN = cv2.getTrackbarPos("Vmin","trackbar window")
VMAX = cv2.getTrackbarPos("Vmax","trackbar window")
SMIN = cv2.getTrackbarPos("Smin","trackbar window")
SMAX = cv2.getTrackbarPos("Smax","trackbar window")

# construct a mask for the colour then perform
# a series of dilation's and erosion's to remove any small
# blobs left in the mask
mask = cv2.inRange(HSV, (HMIN, SMIN, VMIN), (HMAX, SMAX, VMAX))
mask = cv2.erode(mask, None, iterations=2)
mask = cv2.dilate(mask, None, iterations=2)
```
We modified these values while using an image of the red ball, once we had an image in which all except the ball was visible we saved the values, these were Hue range 0 to 10, Saturation range 180 to 255 and value range 180 to 255.   
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MASKED_BALL.PNG"/>  
Now that we had the masked image we need to use one of openCVs tools to find the location of the ball in the image and send the (x,y) co-ordinates for the centre of the circle as well as its radius to MATLAB, to find the ball we use `cv2.findcontours()` and to send it to MATLAB we use ROS, the code is shown below.
```python
# Search for red balls

# find contours in the mask and initialize the current
# (x, y) center of the ball
cnts_R = cv2.findContours(mask_R.copy(), cv2.RETR_EXTERNAL,
	cv2.CHAIN_APPROX_SIMPLE)[-2]
center_R = None
 	
# only proceed if at least one contour was found
if len(cnts_R) > 0:
	# find the largest contour in the mask, then use
	# it to compute the minimum enclosing circle and
	# centroid
	c_R = max(cnts_R, key=cv2.contourArea)
	((x_R, y_R), radius_R) = cv2.minEnclosingCircle(c_R)
	M_R = cv2.moments(c_R)
	center_R = (int(M_R["m10"] / M_R["m00"]), int(M_R["m01"] / M_R["m00"]))
 
	# only proceed if the radius meets a minimum size
	if radius_R > 25:
		# draw the circle and centroid on the frame
		# then update the list of tracked points
		cv2.circle(frame, (int(x_R), int(y_R)), int(radius_R),
			(0, 255, 255), 2)
		cv2.circle(frame, center_R, 5, (0, 0, 255), -1)
		print "X =", x_R, "    Y =", y_R, "    radius =", radius_R
		pos = Float64MultiArray()			
		pos.data = [x_R, y_R, radius_R]
		pub_openCV.publish(pos)
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
__openCV - object tracking__  
***
[DECODER](https://github.com/AandJ/ROCO224/blob/master/Decoder.md)  
***
[MATLAB](https://github.com/AandJ/ROCO224/blob/master/MATLAB.md)  

