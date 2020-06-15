import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class getjson extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/json/python.json"),
      builder: (context,snapshot){
          var mydata = json.decode(snapshot.data.toString());
          if( mydata == null)
            {
              return Scaffold(
                body: Center(
                  child: Text(
                    "Loading"
                  ),
                ),
              );
            }
          else{
                return quizpage();
          }
      }
    );
  }
}


class quizpage extends StatefulWidget{
  @override
  _quizpageState createState() => _quizpageState();

}

class _quizpageState extends State<quizpage>{

  Widget choicebutton(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: (){},
        child: Text(
          "option 1",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        color: Colors.indigo,
        splashColor: Colors.indigoAccent[700],
        highlightColor: Colors.indigoAccent[700],
        minWidth: 200.0,
        height:45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Sample Question",
                style: TextStyle(
                  fontSize: 18.0,
                  //fontFamily:
                ),
              ),
            ),
          ),

          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                choicebutton(),
                choicebutton(),
                choicebutton(),
                choicebutton(),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Center(
                  child: Text(
                    "30",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,

                    ),
                  )
              ),
            ),
          ),


      ],
      ),
    );
  }
}