import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import 'package:quizapp/resultpage.dart';

class getjson extends StatelessWidget{
  String lanname;
  getjson({ Key key, @required this.lanname}): super(key : key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/json/$lanname.json"),
      builder: (context,snapshot){
          List mydata = json.decode(snapshot.data.toString());
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
                return quizpage(mydata: mydata);
          }
      }
    );
  }
}


class quizpage extends StatefulWidget{
  var mydata;
  quizpage({Key key, @required this.mydata}) : super(key : key);
  @override
  _quizpageState createState() => _quizpageState(mydata);

}

class _quizpageState extends State<quizpage>{
  var mydata;
  _quizpageState(this.mydata);
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int q = 1;
  int timer =30;
  String showtimer ="30";
  bool canceltimer = false;

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

@override
void initState(){
  starttimer();
  super.initState();
}
void checkanswer(String option){
  if( (mydata[2][q.toString()]) == (mydata[1][q.toString()][option]) ){
    marks = marks + 5;
    colortoshow =right;
  }
  else{
    colortoshow =wrong;
  }
  setState(() {
    btncolor[option] = colortoshow;
    canceltimer = true;
  });

  Timer(Duration(seconds: 2), nextquestion);
}


void starttimer() async{
  const onesec = Duration(seconds: 1);
  Timer.periodic(onesec,(Timer t){
    setState(() {
      if(timer < 1){
        t.cancel();
        nextquestion();
      }else if(canceltimer == true){
        t.cancel();
      }
      else{
        timer = timer - 1;

      }
      showtimer = timer.toString();
    });

  });
}
void nextquestion(){
  canceltimer =false;
  timer=30;
  setState(() {
    if( q < 10){
      q++;
    }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks :marks),
        ));
    }
    btncolor["a"] = Colors.indigoAccent;
    btncolor["b"] = Colors.indigoAccent;
    btncolor["c"] = Colors.indigoAccent;
    btncolor["d"] = Colors.indigoAccent;

  });
  starttimer();
}
  Widget choicebutton(String options){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(options),
        child: Text(
         mydata[1][q.toString()][options],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        color: btncolor[options],
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
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "QuizStar",
            ),
            content: Text(
              "You Can't go Back At This Stage"
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Ok"
                ),
              ),
            ],
          )
        );
      },
      child:Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  mydata[0][q.toString()],
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
                  choicebutton("a"),
                  choicebutton("b"),
                  choicebutton("c"),

                  choicebutton("d"),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                    child: Text(
                      showtimer,
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
      ),
    );
  }
}