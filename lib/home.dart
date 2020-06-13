import 'package:flutter/material.dart';



class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Widget customcard(String lanname){
    return Padding(
      padding : EdgeInsets.all(
        20.0,
      ),
      child: InkWell(

        child: Material(
          elevation: 10.0,
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child:Container(
                      height: 200.0,
                      width:200.0,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                            "assset/"
                          ),
                        )
                      )
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    lanname,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                     // fontFamily:
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "welcome python",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                     // fontFamily:
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz Star",
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Python"),
          customcard("Java"),
          customcard("Javascript"),
          customcard("C#"),
          customcard(),
        ],
      ),
    );
  }
}
