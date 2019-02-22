import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ivr_p2",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.deepOrangeAccent
            ),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
              color: Colors.white,
            child: Text("Login",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 25.0
              ),
            ),
            splashColor: Colors.indigo,),
            RaisedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signup()),
              );
            },
              color: Colors.white,
              child: Text("Sign UP",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 25.0
                ),
              ),
              splashColor: Colors.indigo,)
          ],
          ),
     ),
          SizedBox(
            width: 40.0,
          ),
          Center(
            child: Text("Welcome \n TO\n IVR",style: TextStyle(
                fontFamily: "cursive",
                fontSize: 25.0
            ),
            textAlign: TextAlign.end,),
          )
        ],
      ),
    );
  }
}

