# openCV

## Introduction 
OpenCV is a library of programming functions mainly aimed at real-time computer vision. We use these programs for locating the balls we wish to pick up and calculating their position relative to the arms camera. We decided to use python to code this node as we were more familiar with openCVs python commands.  

## The Code
the first thing we must do is obtain an image from the camera on the arm and convert it to HSV, we do this with the python commands.  
```python
## grab the current frame
(grabbed, frame) = camera.read()

# Blur the frame and convert it to the HSV color space
blurred = cv2.GaussianBlur(frame, (11, 11), 0)
HSV = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
```  
Now that we have the HSV image we need to mask out all the data we don't want, for this we need to find the range of the Hue, Saturation and Value values for our ball. To determine these we created slider which we could modify until we had a black and white image in which the ball was shown as white with the rest of the image blacked out. We modified the slider values while using an image of the red ball as the input frame, once we had a masked image in which only the ball was visible we saved the values, these values were, Hue range 0 to 10, Saturation range 180 to 255 and value range 180 to 255. The masked result is shown below   
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MASKEDBALL.png"/>  
</p>
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
In this code you can see that we set the minimum radius of an object to be considered as the ball was 25 pixels, this stop our program from recognising small amounts of red as our ball as well as set a limit on what the arm would try and reach for.  

# The Maths
Now that we had the radius of the ball we could use this to obtain the distance from the camera to the ball, this is possible as we are using balls of a consistent size. We started by measuring the radius in pixels at set distances and plotting them.
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/openCVSpreadsheet.png"  height="330"/> <img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/GraphOPENCV.png" height="330"/>  
Source : https://mycurvefit.com  
</p>
We then used the websites equation generator to generate an equation that would approximately fit our graph, we multiplied the equation by 10 to convert from cm to mm, the result of this was.  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/DistanceEQ.PNG"/>  
</p>
To test this we entered distance values greater than the ones we plotted and compared the result of the equation to the new measurements we took, we found the equation to be accurate to 1cm which we considered an acceptable margin of error.  
We decided to apply this equation on MATLAB rather than in the python node.  

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

