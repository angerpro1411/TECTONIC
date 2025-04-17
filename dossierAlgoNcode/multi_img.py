import cv2
import imutils
from scipy.spatial import distance as dist
from collections import OrderedDict
import numpy as np

class ColorLabeler:
    def __init__(self):
        # initialize the colors dictionary, containing the color
        # name as the key and the RGB tuple as the value
        colors = OrderedDict({
            "red": (255, 0, 0),
            "green": (0, 255, 0),
            "blue": (0, 0, 255)})
        # allocate memory for the L*a*b* image, then initialize
        # the color names list
        self.lab = np.zeros((len(colors), 1, 3), dtype="uint8")
        self.colorNames = []
        # loop over the colors dictionary
        for (i, (name, rgb)) in enumerate(colors.items()):
            # update the L*a*b* array and the color names list
            self.lab[i] = rgb
            self.colorNames.append(name)
        # convert the L*a*b* array from the RGB color space
        # to L*a*b*
        self.lab = cv2.cvtColor(self.lab, cv2.COLOR_RGB2LAB)
		
    def label(self, image, c):
        # construct a mask for the contour, then compute the
        # average L*a*b* value for the masked region
        mask = np.zeros(image.shape[:2], dtype="uint8")
        cv2.drawContours(mask, [c], -1, 255, -1)
        mask = cv2.erode(mask, None, iterations=2)
        mean = cv2.mean(image, mask=mask)[:3]
        # initialize the minimum distance found thus far
        minDist = (np.inf, None)
        # loop over the known L*a*b* color values
        for (i, row) in enumerate(self.lab):
            # compute the distance between the current L*a*b*
            # color value and the mean of the image
            d = dist.euclidean(row[0], mean)
            # if the distance is smaller than the current distance,
            # then update the bookkeeping variable
            if d < minDist[0]:
                minDist = (d, i)
        # return the name of the color with the smallest distance
        return self.colorNames[minDist[1]]


class ShapeDetector:
	def __init__(self):
		pass
	def detect(self, c, espilon):
		# initialize the shape name and approximate the contour
		shape = "unidentified"
		peri = cv2.arcLength(c, True)
		approx = cv2.approxPolyDP(c, espilon * peri, True)
				# if the shape is a triangle, it will have 3 vertices
		if len(approx) == 3:
			shape = "triangle"
		# if the shape has 4 vertices, it is either a square or
		# a rectangle
		elif len(approx) == 4:
			# compute the bounding box of the contour and use the
			# bounding box to compute the aspect ratio
			(x, y, w, h) = cv2.boundingRect(approx)
			ar = w / float(h)
			# a square will have an aspect ratio that is approximately
			# equal to one, otherwise, the shape is a rectangle
			shape = "square" if ar >= 0.95 and ar <= 1.05 else "rectangle"
		# if the shape is a pentagon, it will have 5 vertices
		elif len(approx) == 5:
			shape = "pentagon"
		elif len(approx) == 6:
			shape = "hexagon"
		elif len(approx) == 7:
			shape = "heptagon"                        
		# otherwise, we assume the shape is a circle
		else:
			shape = "circle"
		# return the name of the shape
		return shape,approx


def stackImages(scale,imgArray):
    rows = len(imgArray)
    cols = len(imgArray[0])
    rowsAvailable = isinstance(imgArray[0], list)
    width = imgArray[0][0].shape[1]
    height = imgArray[0][0].shape[0]
    if rowsAvailable:
        for x in range ( 0, rows):
            for y in range(0, cols):
                if imgArray[x][y].shape[:2] == imgArray[0][0].shape [:2]:
                    imgArray[x][y] = cv2.resize(imgArray[x][y], (0, 0), None, scale, scale)
                else:
                    imgArray[x][y] = cv2.resize(imgArray[x][y], (imgArray[0][0].shape[1], imgArray[0][0].shape[0]), None, scale,scale)
                if len(imgArray[x][y].shape) == 2: imgArray[x][y] = cv2.cvtColor(imgArray[x][y], cv2.COLOR_GRAY2BGR)
        imageBlank = np.zeros((height, width, 3), np.uint8)
        hor = [imageBlank]*rows
        hor_con = [imageBlank]*rows
        for x in range(0, rows):
            hor[x] = np.hstack(imgArray[x])
        ver = np.vstack(hor)
    else:
        for x in range(0, rows):
            if imgArray[x].shape[:2] == imgArray[0].shape[:2]:
                imgArray[x] = cv2.resize(imgArray[x], (0, 0), None, scale, scale)
            else:
                imgArray[x] = cv2.resize(imgArray[x], (imgArray[0].shape[1], imgArray[0].shape[0]), None, scale, scale)
            if len(imgArray[x].shape) == 2: imgArray[x] = cv2.cvtColor(imgArray[x], cv2.COLOR_GRAY2BGR)
        hor = np.hstack(imgArray)
        ver = hor
    return ver

def nothing(x) :
    pass

def imageCenter(image) : 
    (h,w) = image.shape[:2]
    cv2.circle(image, (w//2, h//2), 7, (255, 0, 0), -1) #where w//2, h//2 are the required frame/image centeroid's XYcoordinates.

def pixel_color(img,x,y) :
    imgRGB = cv2.imread(img)
    imgHSV = cv2.cvtColor(imgRGB,cv2.COLOR_BGR2HSV)
    #in order B G R
    #img[row,column], row means y, column means x
    # b,g,r = imgRGB[int(x),int(y)]
    # print(r,g,b)
    h,s,v = imgHSV[int(y),int(x)]
    # print(h,s,v)

    #red
    redLower = np.array([136,87,111], np.uint8)
    redUpper = np.array([180,255,255], np.uint8)


    #green
    greenLower = np.array([25,52,72], np.uint8)
    greenUpper = np.array([102,255,255], np.uint8)

    #blue
    blueLower = np.array([94,80,2], np.uint8)
    blueUpper = np.array([120,255,255], np.uint8)
    
    #yellow
    yellowLower = np.array([23,59,119], np.uint8)
    yellowUpper = np.array([54,255,255], np.uint8)

    #orange
    orangeLower = np.array([0,50,80], np.uint8)
    orangeUpper = np.array([20,255,255], np.uint8)    

    #purple
    purpleLower = np.array([130,80,80], np.uint8)
    purpleUpper = np.array([150,255,255], np.uint8)        

    redCheck = all([h,s,v] >= redLower) and all([h,s,v] <= redUpper)
    greenCheck = all([h,s,v] >= greenLower) and all([h,s,v] <= greenUpper)
    blueCheck = all([h,s,v] >= blueLower) and all([h,s,v] <= blueUpper)
    yellowCheck = all([h,s,v] >= yellowLower) and all([h,s,v] <= yellowUpper)
    orangeCheck = all([h,s,v] >= orangeLower) and all([h,s,v] <= orangeUpper)
    purpleCheck = all([h,s,v] >= purpleLower) and all([h,s,v] <= purpleUpper)            

    if redCheck == 1:
        return "Red Color"
    elif greenCheck == 1:
        return "Green Color"
    elif blueCheck == 1:
        return "Blue Color"
    elif yellowCheck == 1:
         return "Yellow Color"
    elif orangeCheck == 1:
         return "Orange Color"
    elif purpleCheck == 1:
         return "Purple Color"
    else :
        return "No color detected"
    
    return "No color detected"

def adjustBrightness(img, factor = 1.2):
    imgHsv = cv2.cvtColor(img,cv2.COLOR_BGR2HSV)
    h,s,v = cv2.split(imgHsv)
    v = np.clip(v*factor, a_min = 0, a_max = 255).astype(np.uint8)
    imgHsv = cv2.merge([h,s,v])
    return cv2.cvtColor(imgHsv,cv2.COLOR_HSV2BGR)

def ObjectLabeler(shape, color):
    if (color == "Green Color") and (shape == "circle"):
        return "Tree"
    elif (shape == "square") or (shape == "rectangle") or (shape == "pentagon") or ((shape == "hexagon")):
        return "House"
    else :
        return "Undefined Object"
    
    return "Undefined Object"


#from the coodination potision of object, we calculate the angle between
#2 vectors, first vector is drone towards east,
#second vector is drone toward object as trigonomectric circle.
def PositionDetector(x,y):
    tanA = float(y/x)
    return tanA  

def LightBalance(image) :
     image = cv2.equalizeHist(image)
     return image

#create trackbar for canny edge detection threshold
cv2.namedWindow("Parameters")
cv2.createTrackbar("ThresLow","Parameters", 45, 255, nothing)
cv2.createTrackbar("ThresHigh","Parameters", 164, 255, nothing)

#create trackbar for kernel
cv2.createTrackbar("kernel va1", "Parameters", 3, 10, nothing)
cv2.createTrackbar("kernel va2", "Parameters", 3, 10, nothing)

#create trackbar for espilon
cv2.createTrackbar("Espilonx10000","Parameters",100,1200,nothing)

#create trackbar for contour Area
cv2.createTrackbar("AreaMin","Parameters",1000,5000,nothing)
cv2.createTrackbar("AreaMax","Parameters",7000,10000,nothing)

#create trackbar for Filter
cv2.createTrackbar("Spatial Window","Parameters",45,100,nothing)
cv2.createTrackbar("Color Window","Parameters",60,100,nothing)

# load the image and resize it to a smaller factor so that
# the shapes can be approximated better
image = cv2.imread("map4.png")

#open a file to write results
file = open("output.txt","a")

#adjust brightness
image = adjustBrightness(image)

#get two first value of img.shape array
(h,w) = image.shape[:2]

#loop for control contour detection and edge detection
while True :
    imgContour = image.copy()
    # blur the resized image slightly, then convert it to both
    # grayscale and the L*a*b* color spaces
    blurred = cv2.GaussianBlur(image, (9, 9), 0)
    gray = cv2.cvtColor(blurred, cv2.COLOR_BGR2GRAY)

    #Historical equalization
    gray = LightBalance(gray)

    #create variables for Filter Trackbars
    SP = cv2.getTrackbarPos("Spatial Window","Parameters")
    SR = cv2.getTrackbarPos("Color Window","Parameters")

    #first parameter of this filter is spatial window radius
    #If sp is small, only nearby pixels affect the result — 
    #   so smoothing is localized.
    #If sp is large, even pixels farther away 
    #   (but with similar color) can be grouped — 
    #       leading to larger smoothed regions.
    # Large sp parameter creates heavy calculation, slow calculation
    #   ,so the computer could take a lot of time to calculate it.
    #       Even the program crashes.
    filtered = cv2.pyrMeanShiftFiltering(image, 45, 60)   
    

    #create variable for trackbar
    ThresLow = cv2.getTrackbarPos("ThresLow","Parameters")
    ThresHigh = cv2.getTrackbarPos("ThresHigh","Parameters")
    
    #canny edge detection
    edges1 = cv2.Canny(image=filtered,threshold1 = ThresLow,threshold2 = ThresHigh)

    #closing image :: END
    #create variable for kernel trackbar
    Kernel_Trackbar1 = cv2.getTrackbarPos("kernel va1", "Parameters")
    Kernel_Trackbar2 = cv2.getTrackbarPos("kernel va2", "Parameters")    
    
    kernel = np.ones((Kernel_Trackbar1,Kernel_Trackbar2), np.uint8)
    closing = cv2.morphologyEx(edges1, cv2.MORPH_CLOSE, kernel, iterations = 1)
    
    
    # find contours in the thresholded image
    cnts,hierarchy = cv2.findContours(closing, cv2.RETR_EXTERNAL,
        cv2.CHAIN_APPROX_SIMPLE)
    
    # initialize the shape detector and color labeler
    sd = ShapeDetector()
    cl = ColorLabeler()

    # loop over the contours
    for c in cnts:
        
        #calculate contour area for removing small contour(noise)
        area = cv2.contourArea(c)
        areaMin = cv2.getTrackbarPos("AreaMin","Parameters")

        areaMax = cv2.getTrackbarPos("AreaMax","Parameters")
        
        Espilonx10000 = cv2.getTrackbarPos("Espilonx10000","Parameters")
        espilon = Espilonx10000/10000

        #put contour detection in a specific condition
        if (area > areaMin): # and area < areaMax :
            # compute the center of the contour
            M = cv2.moments(c)
            cX = int((M["m10"] / M["m00"]) )
            cY = int((M["m01"] / M["m00"]) )

            #Real position compare to drone
            rX = cX - w/2
            rY = h/2 - cY

            # detect the shape of the contour and label the color
            (shape,approx) = sd.detect(c,espilon)
            
            # color = cl.label(lab, c)
            color = pixel_color('map4.png',cX,cY)

            #object labeler
            object = ObjectLabeler(shape,color)

            # multiply the contour (x, y)-coordinates by the resize ratio,
            # then draw the contours and the name of the shape and labeled
            # color on the image
            c = c.astype("float")
            c = c.astype("int")
            text = "{} {}".format(color, shape)
            cv2.drawContours(imgContour, [approx], -1, (0, 255, 0), 2)
 
            cv2.putText(imgContour, text, (cX, cY),
            	cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 0), 2)

            #Print the real coordination offset with top-left corner.
            # cv2.putText(imgContour,"({},{})".format(cX,cY),(cX, cY+40),
            # 	cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 0), 2)

            #Print the new coordination offset with center of image.
            cv2.putText(imgContour,"({},{})".format(rX,rY),(cX, cY+20),
            	cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 0), 2)
            
            cv2.putText(imgContour, object, (cX, cY+40),
            	cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 0), 2)

            cv2.putText(imgContour, " tanA={:.2f}".format(PositionDetector(rX,rY)), (cX, cY+60),
            	cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 0), 2) 

            # #write results to file
            # file.writelines(text + "\n")
            # file.write("({},{})\n".format(rX,rY))
            # file.writelines(object + "\n")
            # file.write("tanA={:.2f}\n".format(PositionDetector(rX,rY)))                        

    # show the output image

    imgStack = stackImages(0.5,([image,blurred,filtered],[edges1,closing,imgContour]))

    cv2.imshow("ImageStack", imgStack)
    cv2.imshow("Image",imgContour)
        
    cv2.waitKey(300)

file.close()