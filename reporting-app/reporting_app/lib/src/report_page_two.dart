import 'package:flutter/material.dart';
import 'report_page_three.dart';

// void main() => runApp(MaterialApp(
//     home: PageTwo()
// ));

//==================================Page Two====================================
class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {//----------Variable Access---------
  final photos = TextEditingController(); //NEED TO LINK!!!!!!!

  // @override
  // void initState() {
  //   super.initState();
    
  // }

  @override
  void dispose() {
    //Clean up controller when the widget is disposed
    photos.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
      body: Container(child: new SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //------------------------------Progress Bar--------------------------
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30.0),
                ),),

              Expanded(//            ++++Driver Info Circle++++
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreenAccent,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                ),),

              Expanded(//            ++++Photo Upload Circle++++
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4.0, color:Colors.redAccent)
                  ),
                  child: Text(
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
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Text(
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
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Text(
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
                  padding: EdgeInsets.all(30.0),
                ),),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
              ),),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Driver \nInfo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Photo \nUpload',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Video\nUpload',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Review\nReport',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
              ),),
            ],
          ),

          //------------------------------Value Fields--------------------------
          Container(//                  ++++Text++++
            margin: EdgeInsets.fromLTRB(10.0,10.0,10.0,0.0),
            child:Text(
              "Upload Photos \nRelated to the \nIncident",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
          ),


          Container(//                  ++++Use Camera++++
            margin: EdgeInsets.fromLTRB(10.0,20.0,10.0,10.0),
            child:FloatingActionButton(
              onPressed: (){
                // urlToGetGCPLink = 'http://10.0.2.2:5625/get_gcp_link';
                // var request = http.MultipartRequest('GET', Uri.parse(urlToGetGCPLink));
                // request.fields['name'] = ""//# TODO: name.toString();
                // var res = await request.send();
              },
              backgroundColor: Colors.amber[200],
              child: Text(
                "Use Camera",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),

          Container(//                  ++++Upload Photos++++
            margin: EdgeInsets.fromLTRB(10.0,10.0,10.0,20.0),
            child:FloatingActionButton(
              onPressed: (){},
              backgroundColor: Colors.amber[200],
              child: Text(
                "Upload from Library",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),

          //----------------------------Submission Button-----------------------
          Container(
            padding: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageThree()));
              },
              backgroundColor: Colors.redAccent,
              child: Text(
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