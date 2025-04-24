# Import OpenCV library
import cv2
import numpy as np
import math

class imageProcessing:
    def pre_processing():
        # Read Image
        img = cv2.imread('OCR-AI\\my_images\\muaz_g.jpg')
        img = cv2.resize(img, (1536,864)) # Resize image

        # convert the image to grayscale format
        img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # apply binary thresholding
        ret, thresh = cv2.threshold(img_gray, 100, 255, cv2.THRESH_BINARY)

        # detect the contours on the binary image using cv2.CHAIN_APPROX_NONE
        contours, hierarchy = cv2.findContours(image=thresh, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        # finding the longest contour
        max_contour = max(contours, key=len) 

        # creating an image mask to delete everything outside of contour
        image_mask = np.zeros_like(img)
        cv2.drawContours(image=image_mask, contours=[max_contour], contourIdx=0, color=(255, 255, 255), thickness=-1)

        # bitwise and of image
        image_copy = cv2.bitwise_and(img, image_mask)

        # convert to gray scale
        image_copy_gray = cv2.cvtColor(image_copy, cv2.COLOR_BGR2GRAY)

        # Approximate the rotated bounding rectangle
        rect = cv2.minAreaRect(max_contour)

        # Calculate the angle of rotation
        angle = rect[-1] - 90

        # Perform deskwing
        rows, cols = image_copy.shape[:2]
        rotation_matrix = cv2.getRotationMatrix2D((cols/2, rows/2), angle, 1)
        deskewed_image = cv2.warpAffine(image_copy_gray, rotation_matrix, (cols, rows), flags=cv2.INTER_LINEAR, borderMode=cv2.BORDER_REPLICATE)

        # limit contour to quadrilateral
        peri = cv2.arcLength(max_contour, True)
        corners = cv2.approxPolyDP(max_contour, 0.04 * peri, True)

        # draw quadrilateral on input image from detected corners
        result = img.copy()
        cv2.polylines(result, [corners], True, (0,0,255), 1, cv2.LINE_AA)

        # see the results
        # cv2.imshow('Not Corrected', result)
        # cv2.waitKey(0)
        # cv2.imshow('De-Skewed', deskewed_image)
        ## cv2.waitKey(0)
        # Intialize Path To Save Pre-Processed Image
        path_to_write = 'OCR-AI\my_images\\pre_processed_image.jpg'
        cv2.imwrite(path_to_write, img_gray)
        # cv2.destroyAllWindows()

        # pass image to vision API 
        return path_to_write





