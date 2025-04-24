from textblob import TextBlob

def detect_guilt(text):
    blob = TextBlob(text)
    polarity = blob.sentiment.polarity
    if polarity < 0:
        print("Guilty")
    else:
        print("Not Guilty")

# Example usage:
input_text = input("Enter text to analyze: ")
detect_guilt(input_text)