import 'globals.dart' as globals;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'report_complete.dart';

// void main() => runApp(MaterialApp(
//     home: PageFour()
// ));

//==================================Page Four===================================
class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {//----------Variable Access-------

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Incidents');

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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreenAccent,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                ),),


              Expanded(//              ++++Confirm Circle++++
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4.0, color:Colors.redAccent)
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
              "Confirm Report \nDetails",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(//                  ++++Title++++
            margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:const Text(
              "Incident Info",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(//                  ++++Incident Info++++
            margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(width: 2.0, color:Colors.amber),
            ),
            child: Text( //TODO: link
              globals.currentIncident.printInfo(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
              ),
            ),
          ),

          Container(//                  ++++Title++++
            margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:const Text(
              "Incident Files",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(//                  ++++Files++++
            margin: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(width: 2.0, color:Colors.amber),
            ),
            child: Text(
              globals.currentIncident.dashcamLink,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15.0,
                fontFamily: 'Montserrat',
              ),
            ),
          ),

          //----------------------------Submission Button-----------------------
          Container(
            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: (){
                Map<String, String> incidents = globals.currentIncident.getIncidentInfo();
                dbRef.push().set(incidents);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const End()));
              },
              backgroundColor: Colors.redAccent,
              child: const Text(
                "Submit Incident",
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