import 'package:flutter/material.dart';
import 'report_page_one.dart';

// void main() => runApp(MaterialApp(
//     home: repHome()
// ));

//==================================Welcome Page================================
class repHome extends StatelessWidget {
  const repHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Colors.amber[300],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(//------------------------------Title-----------------------
              child:Text(
                "Traffic Pro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Montserrat',
                ),
            ),
          ),
          Container(//-----------------------------Center Image-----------------
            child:Image(image: AssetImage('assets/car.png'),),
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
          ),
          Container(//-----------------------------Report Button----------------
              margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: (){
                Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PageOne()));
              },
              backgroundColor: Colors.redAccent,
              child: Text(
                "Start Report",
                style: TextStyle(
                  fontSize: 40.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}