import numpy as np
import cv2 as cv
from matplotlib import pyplot as plt

img = cv.imread('/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/Images/peppers.png')    
assert img is not None, "file could not be read, check with os.path.exists()"

original = np.copy(img)

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)

blurred = cv.GaussianBlur(gray,(7,7),cv.BORDER_DEFAULT)

ret, thresh = cv.threshold(blurred,0,255,cv.THRESH_BINARY_INV+cv.THRESH_OTSU)

thresh = 255-thresh

kernel = np.ones((5,5),np.uint8)

dilate = cv.dilate(thresh,kernel)

dilate = np.uint8(dilate)

contours = cv.Canny(dilate,100,100)

contours = 255-contours

markers = np.zeros(contours.shape, dtype= 'int32')
cv.circle(markers, (93, 487), 5, 1, -1)
cv.circle(markers, (2, 475), 5, 1, -1) 
cv.circle(markers, (98, 429), 5, 2, -1) 
cv.circle(markers, (126, 304), 5, 2, -1) 
cv.circle(markers, (140, 216), 5, 2, -1) 
cv.circle(markers, (248, 299), 5, 3, -1) 
cv.circle(markers, (387, 319), 5, 3, -1) 
cv.circle(markers, (293, 232), 5, 3, -1) 
cv.circle(markers, (306, 122), 5, 4, -1) 
cv.circle(markers, (226, 32), 5, 4, -1) 
cv.circle(markers, (470, 342), 5, 5, -1) 
cv.circle(markers, (474, 364), 5, 5, -1) 
cv.circle(markers, (489, 419), 5, 5, -1) 
cv.circle(markers, (445, 182), 5, 6, -1) 
cv.circle(markers, (99, 49), 5, 7, -1) 
cv.circle(markers, (57, 118), 5, 7, -1)
cv.circle(markers, (319, 15), 5, 8, -1)
cv.circle(markers, (174, 416), 5, 9, -1)


# Add one to all labels so that sure background is not 0, but 1


markers = cv.watershed(img,markers)

h = np.histogram(markers,np.arange(-1,256))
    
markers = np.uint8(markers*25)

imC = cv.applyColorMap(markers, cv.COLORMAP_JET)

cv.imshow('Original.png', original)
cv.imwrite('Blurred.png',blurred)
cv.imwrite('Otsu Thresh.png',thresh)
cv.imwrite('Dilate.png',dilate)
cv.imwrite('contours.png',contours)
cv.imwrite('Markers.png',imC)

cv.waitKey(0) 
cv.destroyAllWindows() 
