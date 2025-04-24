import requests

# Replace 'http://your-flask-server/receive_image' with the actual URL of your Flask route
url = 'http://127.0.0.1:5000/receive_image'

# Path to the image file you want to upload
image_path = r'C:\Users\amaan\Documents\McMaster\CAPSTONE\traffic-pro\OCR-AI\my_images\muaz_g.jpg'

# Open the image file in binary mode and read its contents
with open(image_path, 'rb') as file:
    image_data = file.read()

# Create a dictionary with the file data
files = {'image': ('image.jpg', image_data)}

# Send a POST request with the image data
response = requests.post(url, files=files)

# Print the response from the server
print(response.text)

#response = requests.get('http://127.0.0.1:5000/get_license_dictionary')
#cities = response.json()
#print(cities)