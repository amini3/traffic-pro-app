from PIL import Image
import pytesseract
import numpy as  np

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
#filename = "C:/Users/ishma/OneDrive/Documents/images.png"
filename = "C:/Users/ishma/OneDrive/Documents/license.png"
img = Image.open(filename)
text = pytesseract.image_to_string(img)
print(text)