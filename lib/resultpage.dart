import 'package:flutter/material.dart';
import 'home.dart';


class  resultpage extends StatefulWidget {
  int marks;
  resultpage({ Key key, @required this.marks}): super(key : key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "assets/images/success.png",
    "assets/images/good.png",
    "assets/images/bad.png",
  ];

  String message;
  String image;
  @override
  void initState(){
    if( marks < 20){
      image = images[2];
      message = "You Should Try Hard.. \n" + "You Scored $marks marks";
    }else if(marks < 35){
      image = images[1];
      message = "You Can Do Better.. \n" + "You Scored $marks marks";
    }else{
      image = images[0];
      message = "You Did Very Well.. \n" + "You Scored $marks marks";
    }
    super.initState();

  }
  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              //elevation: 10.0,
              child: Container(

                child: Column(
                  children: <Widget>[
                   Material(

                     child: Container(
//                       width:300.0,
//                       height: 300.0,
//                       child: ClipRect(
//                           child:Image(
//                             image: AssetImage(
//                               image,
//                             ),
//                           ),
//                       ),
                     ),
                   ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 22.0,
                            //fontFamily:

                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  borderSide: BorderSide(width: 3.0,color:Colors.indigo),
                  splashColor: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(
                    vertical:10.0,
                    horizontal: 25.0,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => home(),
                    ));

                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
