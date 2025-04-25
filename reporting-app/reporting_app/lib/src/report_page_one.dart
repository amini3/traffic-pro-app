import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reporting_app/src/incident.dart';
import 'report_page_two.dart';
import 'globals.dart' as globals;


// void main() => runApp(MaterialApp(
//     home: PageOne()
// ));

// var currentIncident;

//==================================Page One====================================
class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {//----------Variable Access---------
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final licenseNumberController = TextEditingController();
  final issueDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  final dobController = TextEditingController();
  final ddrefController = TextEditingController();
  final heightController = TextEditingController();
  final sexController = TextEditingController();
  final licenseClassController = TextEditingController();
  final restController = TextEditingController();
  final phoneNoController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final vehicleMakeController = TextEditingController();
  final vehicleModelController = TextEditingController();
  final vehiclePlateController = TextEditingController();
  final vehicleYearController = TextEditingController();
  final vehicleColourController = TextEditingController();
  final statementController = TextEditingController();

  late Future<Incident> futureIncident;

  // late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dbRef = FirebaseDatabase.instance.ref().child('Incidents');
  }

  @override
  void dispose() {
    //Clean up controller when the widget is disposed
    nameController.dispose();
    addressController.dispose();
    licenseNumberController.dispose();
    issueDateController.dispose();
    expiryDateController.dispose();
    dobController.dispose();
    ddrefController.dispose();
    heightController.dispose();
    sexController.dispose();
    licenseClassController.dispose();
    restController.dispose();
    phoneNoController.dispose();
    vehicleTypeController.dispose();
    vehicleMakeController.dispose();
    vehicleModelController.dispose();
    vehiclePlateController.dispose();
    vehicleYearController.dispose();
    vehicleColourController.dispose();
    statementController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report Creation',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[300],
        toolbarHeight: 100.0,

      ),
      body: Container(child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //------------------------------Progress Bar--------------------------
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                ),),

              Expanded(//            ++++Driver Info Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4.0, color:Colors.redAccent)
                  ),
                  child: const Text(
                    '1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),),

              Expanded(//            ++++Photo Upload Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Text(
                    '2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),),

              Expanded(//            ++++Video Upload Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Text(
                    '3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),),

              Expanded(//              ++++Confirm Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Text(
                    '4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                ),),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
              ),),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: const Text(
                  'Driver \nInfo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: const Text(
                  'Photo \nUpload',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: const Text(
                  'Video\nUpload',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: const Text(
                  'Review\nReport',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
              ),),
            ],
          ),

          //------------------------------Value Fields--------------------------
          Container(//                  ++++Scan Info++++
            margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: () async {
                // print(name);
                
                var inputImage = await getImage(); // as File;
                String urlToInsertImage = "http://10.0.2.2:5625/receive_image";
                var request = http.MultipartRequest('POST', Uri.parse(urlToInsertImage));
                // request.fields['ProductId'] = productId.toString();
                request.files.add(http.MultipartFile.fromBytes('image', File(inputImage!.path).readAsBytesSync(),filename: inputImage!.path));
                var res = await request.send();


                // print("Image sent. \n");

                // String urlToGetDictionary = 'http://127.0.0.1:5625/get_license_dictionary';
                // final response = await http.get(Uri.parse(urlToGetDictionary));
                var incident = await fetchIncident();
                globals.currentIncident = incident;

                // print("Incident info received. \n");

                nameController.text = incident.name.toString();
                addressController.text = incident.address.toString();
                licenseNumberController.text = incident.licenseNumber.toString();
                issueDateController.text = incident.issueDate.toString();
                expiryDateController.text = incident.expiryDate.toString();
                dobController.text = incident.dob.toString();
                ddrefController.text = incident.ddref.toString();
                heightController.text = incident.height.toString();
                sexController.text = incident.sex.toString();
                licenseClassController.text = incident.licenseClass.toString();
                restController.text = incident.rest.toString();
              },
              backgroundColor: Colors.amber[200],
              child: const Text(
                "Autofill License Info",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),

          Container(//                    ++++Name++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
          ),

          Container(//                  ++++Address++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Address',
              ),
            ),
          ),

          Container(//              ++++License Number++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: licenseNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License Number',
              ),
            ),
          ),

          Container(//                  ++++issueDate++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: issueDateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License Issue Date',
              ),
            ),
          ),

          Container(//                  ++++expiryDate++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: expiryDateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License Expiry Date',
              ),
            ),
          ),

          Container(//                    ++++DoB++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: dobController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Date of Birth',
              ),
            ),
          ),

          Container(//                   ++++ddref++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: ddrefController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License DD/REF',
              ),
            ),
          ),

          Container(//                    ++++height++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Height',
              ),
            ),
          ),

          Container(//                    ++++sex++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: sexController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Sex',
              ),
            ),
          ),

          Container(//                    ++++licenseClass++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: licenseClassController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License Class',
              ),
            ),
          ),

          Container(//                  ++++Restrictions++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: restController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Restrictions (if any)',
              ),
            ),
          ),

          Container(//                  ++++Phone Number++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: phoneNoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Phone Number',
              ),
            ),
          ),

          Container(//                  ++++Vehicle Type++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: vehicleTypeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Vehicle Type',
              ),
            ),
          ),

          Container(//                  ++++Vehicle Make++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: vehicleMakeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Vehicle Make',
              ),
            ),
          ),

          Container(//                  ++++Vehicle Model++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: vehicleModelController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Vehicle Model',
              ),
            ),
          ),

          Container(//                  ++++Vehicle Plate++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: vehiclePlateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Vehicle License Plate',
              ),
            ),
          ),

          Container(//                  ++++Vehicle Year++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: vehicleYearController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Vehicle Year',
              ),
            ),
          ),

          Container(//                  ++++Vehicle Colour++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: vehicleColourController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Vehicle Colour',
              ),
            ),
          ),

          Container(//                  ++++Incident Description++++
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:TextField(
              controller: statementController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Please Describe the Incident Here',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              ),
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
            ),
          ),

          //----------------------------Submission Button-----------------------
          Container(
            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: (){
                Map<String, String> incidents = {
                  'name': nameController.text,
                  'address': addressController.text,
                  'licenseNumber': licenseNumberController.text,
                  'issueDate': issueDateController.text,
                  'expiryDate': expiryDateController.text,
                  'dob': dobController.text,
                  'ddref': ddrefController.text,
                  'height': heightController.text,
                  'sex': sexController.text,
                  'licenseClass': licenseClassController.text,
                  'rest': restController.text,
                  'phoneNo': phoneNoController.text,
                  'vehicleType': vehicleTypeController.text,
                  'vehicleMake': vehicleMakeController.text,
                  'vehicleModel': vehicleModelController.text,
                  'vehiclePlate': vehiclePlateController.text,
                  'vehicleYear': vehicleYearController.text,
                  'vehicleColour': vehicleColourController.text,
                  'statement': statementController.text,
                };

                // dbRef.push().set(incidents);
                globals.currentIncident.setValues(incidents);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageTwo()));
              },
              backgroundColor: Colors.redAccent,
              child: const Text(
                "Next Step",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      ),
      ),)
    );
  }
}


Future<File> getImage() async {
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //TO convert Xfile into file
  
  File file = File(image!.path);
  //print(‘Image picked’);
  return file;
}

Future<Incident> fetchIncident() async {
  String urlToGetDictionary = 'http://10.0.2.2:5625/get_license_dictionary';
  //'http://192.168.0.53:5000/get_license_dictionary'
  //'http://127.0.0.1:5625/get_license_dictionary'

  // try {
    final response = await http.get(Uri.parse(urlToGetDictionary));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return Incident.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load album');
    }
  // } on SocketException {
  //   throw Exception('SocketException occured.');
  // } catch (e) {
  //   throw Exception('Exception occured.');
  // }
  
}