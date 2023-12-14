import numpy as np
import cv2 as cv
from matplotlib import pyplot as plt

img = cv.imread('/home/shothogun/Documents/Projects/UnB/PI/image-processing-discipline/Images/lena_gray_512.png')    
assert img is not None, "file could not be read, check with os.path.exists()"

original = np.copy(img)

gray = cv.cvtColor(img,cv.COLOR_BGR2GRAY)

blurred = cv.GaussianBlur(gray,(5,5),cv.BORDER_DEFAULT)

ret, thresh = cv.threshold(blurred,0,255,cv.THRESH_BINARY_INV+cv.THRESH_OTSU)

thresh = 255-thresh

kernel = np.ones((5,5),np.uint8)

dilate = cv.dilate(thresh,kernel)

dilate = np.uint8(dilate)

contours = cv.Canny(dilate,100,100)

markers = np.zeros(contours.shape, dtype= 'int32')
# Rosto
cv.circle(markers, (309, 242), 5, 1, -1)
cv.circle(markers, (330, 268), 5, 1, -1)
cv.circle(markers, (337, 259), 5, 1, -1)

#Cabelo direito
cv.circle(markers, (363, 265), 5, 2, -1)
cv.circle(markers, (367, 327), 5, 2, -1)
cv.circle(markers, (334, 366), 5, 2, -1)
cv.circle(markers, (364, 210), 5, 2, -1)

#Cabelo esquerdo
cv.circle(markers, (209,358), 5, 3, -1) 

#Chapeu 
cv.circle(markers, (300,202), 5, 4, -1) 
cv.circle(markers, (257,143), 5, 4, -1) 
cv.circle(markers, (371,191), 5, 4, -1) 
cv.circle(markers, (361,191), 5, 4, -1) 
cv.circle(markers, (175,118), 5, 4, -1) 
cv.circle(markers, (146,148), 5, 4, -1) 
cv.circle(markers, (172,86), 5, 4, -1) 
cv.circle(markers, (128,258), 5, 4, -1) 

# Pena chapeu
cv.circle(markers, (212,220), 5, 5, -1) 
cv.circle(markers, (212,220), 5, 5, -1) 
cv.circle(markers, (118,338), 5, 5, -1) 
cv.circle(markers, (129,430), 5, 5, -1) 
cv.circle(markers, (145,267), 5, 5, -1) 

# Espelho
cv.circle(markers, (393,272), 5, 6, -1) 
cv.circle(markers, (449,274), 5, 6, -1) 
cv.circle(markers, (406,55), 5, 6, -1) 

# Add one to all labels so that sure background is not 0, but 1


markers = cv.watershed(img,markers)

h = np.histogram(markers,np.arange(-1,256))
    
markers = np.uint8(markers*25)

imC = cv.applyColorMap(markers, cv.COLORMAP_JET)

cv.imshow('original.png', original)
cv.imshow('blurred.png',blurred)
cv.imshow('otsu.png',thresh)
cv.imshow('contours.png',contours)
cv.imwrite('markers.png',imC)

cv.waitKey(0) 
cv.destroyAllWindows() 
