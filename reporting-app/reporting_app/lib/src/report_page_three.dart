import 'package:flutter/material.dart';
import 'report_page_four.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;


// void main() => runApp(MaterialApp(
//     home: PageThree()
// ));

var gcpLink = "";

//==================================Page Three==================================
class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {//----------Variable Access-----
  final videos = TextEditingController(); //NEED TO LINK!!!!!!!


  @override
  void dispose() {
    //Clean up controller when the widget is disposed
    videos.dispose();
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreenAccent,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                ),),

              Expanded(//            ++++Photo Upload Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreenAccent,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                ),),

              Expanded(//            ++++Video Upload Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4.0, color:Colors.redAccent)
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
          Container(//                  ++++Text++++
            margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,0.0),
            child:const Text(
              "Upload Videos \nRelated to the \nIncident",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(//                  ++++Use Camera++++
            margin: const EdgeInsets.fromLTRB(10.0,20.0,10.0,10.0),
            child:FloatingActionButton(
              onPressed: () async {
                gcpLink = await getGCPLink();
                setState(() {
                  // print("pressed: $gcpLink");
                  globals.currentIncident.dashcamLink = gcpLink;
                  gcpLink = gcpLink;
                  // print("after pressed: $gcpLink");
                });
                globals.currentIncident.sentiment = await getSentiment();
              },
              backgroundColor: Colors.amber[200],
              child: const Text(
                "Fetch Dashcam Video",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          // Text(gcpLink),
          // Text(
          //   gcpLink,
          //   style: const TextStyle(
          //     fontSize: 18,
          //     fontFamily:
          //     "Roboto Font Family",
          //     fontWeight: FontWeight.w400,
          //     color: Colors.black),
          // ),
          Linkify(
            onOpen: (gcpLink) async {

              // final Uri url = Uri.parse(gcpLink.toString());
              // gcpLink.url;
              if (!await launchUrl(Uri.parse(gcpLink.url.replaceAll('"', '')))) {
                throw Exception('Could not launch ${gcpLink.url}');
              }
            },
            text: "Link to video: $gcpLink",
            style: TextStyle(color: Colors.black),
            linkStyle: TextStyle(color: Colors.blue),
          ),

          // Container(//                  ++++Upload Videos++++
          //   margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,20.0),
          //   child:FloatingActionButton(
          //     onPressed: (){},
          //     backgroundColor: Colors.amber[200],
          //     child: const Text(
          //       "Upload from Library",
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         letterSpacing: 2.0,
          //         color: Colors.black,
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //   ),
          // ),

          // Container(//                  ++++Upload Dashcam++++
          //   margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,20.0),
          //   child:FloatingActionButton(
          //     onPressed: (){},
          //     backgroundColor: Colors.amber,
          //     child: const Text(
          //       "Upload Dashcam Recording",
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         letterSpacing: 2.0,
          //         color: Colors.black,
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //   ),
          // ),

          //----------------------------Submission Button-----------------------
          Container(
            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageFour()));
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

Future<String> getGCPLink() async {
  String urlToGetGCPLink = 'http://10.0.2.2:5625/get_gcp_link';

  // Construct the full URL with query parameters
  var url = Uri.parse(urlToGetGCPLink).replace(queryParameters: {
    'name': globals.currentIncident.name,
  });

  // Make a GET request to the server with query parameters
  var response = await http.get(url);

  // Check if the request was successful (status code 200)
  if (response.statusCode == 200) {
    // Parse the response body as a string
    print('Response body: ${response.body}');
    return response.body;
  } else {
    // Handle errors
    print('Error: ${response.statusCode}');
    return "No video available.";
  }

  // var request = http.MultipartRequest('GET', Uri.parse(urlToGetGCPLink));
  // // request.fields['name'] = globals.currentIncident.name.toString();
  // final queryParameters = {
  //   'name': globals.currentIncident.name,
  // };
  // final uri =
  //     Uri.http('www.myurl.com', '/api/v1/test', queryParameters);
  // var res = await request.send();
  // print(res.toString());
  // return res.toString();

  // final response = await http.get(Uri.parse(urlToGetGCPLink));
  //   // request.fields['name'] = globals.currentIncident.name.toString();


  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response, then parse the JSON.
  //   return Incident.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  // } else {
  //   // If the server did not return a 200 OK response, then throw an exception.
  //   throw Exception('Failed to load album');
  // }
}

// void updateGCPLink(){
//  setState(() {
//  gcpLink = "Sahil";
//  });
// }

Future<String> getSentiment() async {
  String urlToGetGCPLink = 'http://10.0.2.2:5625/get_sentiment';

  // Construct the full URL with query parameters
  var url = Uri.parse(urlToGetGCPLink).replace(queryParameters: {
    'statement': globals.currentIncident.statement,
  });

  // Make a GET request to the server with query parameters
  var response = await http.get(url);

  // Check if the request was successful (status code 200)
  if (response.statusCode == 200) {
    // Parse the response body as a string
    print('Response body: ${response.body}');
    return response.body;
  } else {
    // Handle errors
    print('Error: ${response.statusCode}');
    return "No sentiment available.";
  }
}