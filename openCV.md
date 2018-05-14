# openCV

## Introduction 
OpenCV is a library of programming functions mainly aimed at real-time computer vision. We use these programs for locating the balls we wish to pick up and calculating their position relative to the arms camera. We decided to use python to code this node as we were more familiar with openCVs python commands.  

## The Code
the first thing we must do is obtain an image from the camera on the arm and convert it to HSV, we do this with the python commands.  
```python
## grab the current frame
(grabbed, frame) = camera.read()

# Blur the frame and convert it to the HSV colour space
blurred = cv2.GaussianBlur(frame, (11, 11), 0)
HSV = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
```  
Now that we have both a BGR and HSV image we need to mask out all the data we don't want, for this we need to find the range of the Hue, Saturation and Value values for our ball in the HSV image and the range of blue green and red in our BGR image. To determine these we created slider which we could modify until we had a black and white image in which the ball was shown as white with the rest of the image blacked out. We modified the slider values while using an image of multiple different coloured balls as the input frame, once we had a masked image in which only the ball was visible we saved the values, these values were, Hue range 0 to 10, Saturation range 180 to 255 and value range 180 to 255 in HSV, and blue range 0 to 40 green range 0 to 80 and red range 120 to 255. The masked result is shown below   
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MASKEDBALL.png"/>  
</p>
Now that we had the masked image we need to use one of openCVs tools to find the location of any balls in the frame and send the (x,y) co-ordinates for the centre of the circle as well as its radius to MATLAB to find the contours in the image we use `cv2.findcontours()`, once we have these contours we use the tool `cv2.minEnclosingCircle()` to drawn a circle around each contour, we then compare the area of the drawn circle against the area of the contour, thi is how we confirm the object is a circle. the resultant frame is shown below  
<p align="center">
<img src="https://raw.githubusercontent.com/AandJ/ROCO224/master/IMAGES/MASKEDBALL_2.png"/>  
</p>
once a circle has been drawn around the red balls we need to work out which is closest to the center of the frame, to do this we have the code loop through the found contours and if the are found to be circles we calculate their euclidean distance from the center, if this distance is less than that f the previous found contour we store the circles values (x,y and radius). Once we have looped through all contours we send the data for the cicle closest to the center to MATLAB via ROS, the code for this is shown below.  

```python
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
***
[Visual Components Simulation](https://github.com/AandJ/ROCO224/blob/master/VCS.md)  
