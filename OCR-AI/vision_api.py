############# Imports #############
from flask import Flask, jsonify, request
import re
import os

# Import Vision API from Google Cloud
from google.cloud import vision
from google.cloud import storage
from vision_preprocessing import imageProcessing

# Import LLM
from vertexai.language_models import TextGenerationModel
from vertexai.preview.generative_models import GenerativeModel, ChatSession


# Setting Flask Application To Name Vision_API
app = Flask(__name__)

# Set Our Google Auth Key
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "OCR-AI\my_key\lucid-bond-415019-35809f1f53c6.json"

############# Globals #############
license_info = {
    'name': '',
    'address': '',
    'licensenumber': '',
    'issuedate': '',
    'expirydate': '',
    'dob': '',
    'ddref': '',
    'height': '',
    'sex': '',
    'licenseclass': '',
    'rest': '',
}


############# Functions #############
def computerVision(content):
    # Enable Utilities To Extract Image Properties
    client = vision.ImageAnnotatorClient()

    # Grab Image Path From Pre-Processing Function
    # path = imageProcessing.pre_processing()

    # Create Image Instance
    # with open(path, "rb") as image_file:
    #    content = image_file.read()

    # Pass To API
    image = vision.Image(content=content)

    # Get Response From Cloud
    response = client.text_detection(image=image) 
    texts = response.text_annotations

    if response.error.message:
        raise Exception(
            "{}\nFor more info on error messages, check: "
            "https://cloud.google.com/apis/design/errors".format(response.error.message)
        )
    
    populateDictionary(texts[0].description)

def populateDictionary(ocrString):
    # Getting The Extracted OCR Information Ready To Pass To LLM 
    model = TextGenerationModel.from_pretrained("text-bison@002")

    # Setting Up Prompt To Send To LLM Model
    txt_prompt = "Given the text string extracted from an Ontario Drivers License using OCR: " + '"' +  ocrString + '"' + \
            " Can you extract the following Information: NAME, ADDRESS, licenseNumber, issueDate, expiryDate, DOB, ddref, HEIGHT, SEX, licenseClass, REST " + \
            "Please note that the OCR may have made some mistakes and there might be some contradicting information, please work accordingly"

    # Sending Response To LLM Model
    response = model.predict(
        txt_prompt
    )

    print(f"Response from Model: \n{response.text}")

    # Define a regular expression pattern to extract key-value pairs
    pattern = r"\*\*(.+?):(.+?)(?=\*\*|$)"  # Colon inside double asterisks

    # Use re.findall to find all matching key-value pairs
    matches = re.findall(pattern, response.text, re.DOTALL)
    # Populate the dictionary with key-value pairs
    for key, value in matches:
        key_space = key.replace(" ", "") # Remove Space
        key_lower = key_space.strip().lower()  # Convert to lower case
        # Check if the lowercase key exists in the dictionary and update its value
        if key_lower in license_info:
            value = value.replace("**", "") # Remove The Asterix
            #value = value.replace(" ", "")
            value = value.replace("\n", " ") # Remove The New Line Character
            license_info[key_lower] = value.strip()

    # Print the resulting dictionary
    print(license_info) 

def getSentiment(report_txt):
    # Getting The Extracted OCR Information Ready To Pass To LLM 
    model = GenerativeModel("gemini-1.0-pro")
    chat = model.start_chat()

    # Setting Up Prompt To Send To LLM Model
    txt_prompt = "The following text is a paragraph from an incident report that a driver has placed after being in an accident" + '"' +  report_txt + '"' + \
                 "Please evalute the users response and see if they were at fault for causing the accident or not" + \
                 "Provide a boolean response of either 'At Fault' or 'Not At Fault'"
    
    # Sending Response To LLM Model
    response = chat.send_message(txt_prompt)

    print(f"Response from Model: \n{response.text}")
    return response.text


def list_blobs():
    """Lists all the blobs in the bucket."""
    bucket_name = "my-raspi-storage"

    storage_client = storage.Client()

    # Note: Client.list_blobs requires at least package version 1.17.0.
    blobs = storage_client.list_blobs(bucket_name)

    # Note: The call returns a response only when the iterator is consumed.
    #for blob in blobs:
    #    print(blob.name)

    return blobs

def generate_gcp_link(files, user_name):
    gcp_link = ''
    gcp_incident_priority = 0
    # Logic To Get The Latest Incident Number
    for file in files:
        if ".mp4" in file.name and user_name in file.name:
            print("filename = " + file.name)
            user_str = file.name
            user_str = user_str.replace(".mp4","")
            incident_str = user_name + "_" + "incident_"
            incident_num = int(user_str.replace(incident_str, ""))
            if gcp_incident_priority < incident_num:
                gcp_incident_priority = incident_num # Update Priority To The Highest Incident Number
                gcp_link = "https://storage.googleapis.com/my-raspi-storage/" + file.name
                print("gcpLink = " + gcp_link)
            
    
    return gcp_link




# Set Up POST, To Recieve Image
@app.route('/receive_image', methods=['POST'])
def receive_image():
    # Get the file from the request
    image_file = request.files['image']

    # Read the contents of the file
    image_data = image_file.read()

    # Pass the Image Data To Our OCR Function
    computerVision(image_data)

    return "Image Succesfully Posted"


# Intialize as a HTTP Packet To Be Grabbed
@app.route('/get_license_dictionary', methods=['GET'])
def get_license_dictionary():
    return jsonify(license_info)

# Intialize as a HTTP Packet To Be Grabbed
@app.route('/get_gcp_link', methods=['GET'])
def get_gcp_link():
    # incident_user_name = str(request.args['name']) # Name Of User Whose Video Link We're Trying To Grab
    incident_user_name = str(request.args.get('name'))
    print(incident_user_name)
    gcp_files = list_blobs()
    gcp_link = generate_gcp_link(gcp_files, incident_user_name)
    return jsonify(gcp_link)

# Intialize as a HTTP Packet To Be Grabbed
@app.route('/get_sentiment', methods=['GET'])
def get_sentiment():
    accident_report = str(request.args.get('statement')) # Extracts The User Report
    report_evaluation = getSentiment(accident_report)
    return jsonify(report_evaluation)



if __name__ == '__main__':
    app.run(debug=True, port=5625) # Ahmed
    # app.run(debug=True) # Amaan
