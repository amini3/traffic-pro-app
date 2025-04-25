import 'package:flutter/material.dart';
import 'home_page.dart';

// void main() => runApp(MaterialApp(
//     home: End()
// ));

//===============================Completion Page================================
class End extends StatelessWidget {
  const End({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        title: const Text(
          "Success",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 60.0,
            letterSpacing: 2.0,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[300],
        toolbarHeight: 170.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //-----------------------------Center Image---------------------------
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightGreenAccent,
            ),
            child: const Icon(
              Icons.check,
              size: 250.0,
            ),
          ),
          //-------------------------Confirmation Message-----------------------
          Container(
            child:const Text(
              "Your Report has been sent to"
                  "\nHamilton Police",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                letterSpacing: 2.0,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          //-----------------------------Report Button--------------------------
          Container(
            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
            child:FloatingActionButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TabPage1()));
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);

              },
              backgroundColor: Colors.redAccent,
              child: const Text(
                "Done",
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