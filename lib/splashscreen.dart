import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';


class splashscreen extends StatefulWidget {
@override
_splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

 @override
 void initState(){
   super.initState();
   Timer(Duration(seconds: 5),(){
     Navigator.of(context).pushReplacement(MaterialPageRoute(
       builder: (context) => home(),
     ));
   }
   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "QuizStar",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white;
          ),
        ),
      ),
    );
  }
}
