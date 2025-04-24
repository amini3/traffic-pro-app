# Use our Google Cloud Authorized Key
import os
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "OCR-AI\my_key\lucid-bond-415019-35809f1f53c6.json"

from google.cloud import aiplatform
# Import LLM
from vertexai.language_models import TextGenerationModel

# Testing LLM
model = TextGenerationModel.from_pretrained("text-bison@002")

# Sending Response To LLM Model
response = model.predict(
    'Give me ten interview questions for the role of program manager.'
)
print("\n")
print(f"Response from Model: {response.text}")