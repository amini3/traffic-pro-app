from flask import Flask, jsonify

app = Flask(__name__)

license_info = {
    'name': 'Amaan Sayed',
    'address': '26 Noreen Drive',
    'licensenumber': 'ABC123',
    'issuedate': '2022/12/29',
    'expirydate': '2026/12/12',
    'dob': '2001/12/12',
    'ddref': 'HP2956592',
    'height': '175',
    'sex': 'M',
    'licenseclass': 'G',
    'rest': '',
}

# Intialize as a HTTP Packet To Be Grabbed
@app.route('/get_license_dictionary', methods=['GET'])
def get_license_dictionary():
    print("got get req")
    return jsonify(license_info)

if __name__ == '__main__':
    app.run(debug=True, port=5625)