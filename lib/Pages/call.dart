import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class call extends StatefulWidget {
  @override
  _callState createState() => _callState();
}

class _callState extends State<call> {
  TextEditingController _url = TextEditingController();

  Future<void> _openURL() async{
    print('open click');
    var url ="tel:"+_url.text;
    if(await canLaunch(url))
      launch(url);
    else
      print('cant open launcher');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("PU IVR")),

        ),
        body: new Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(controller: _url,
                keyboardType: TextInputType.numberWithOptions(),),
              SizedBox(
                height:250.0 ,
              ),
              RaisedButton(onPressed: _openURL,
                child: Icon(Icons.call),)
            ],
          ),
        ),
      ),
    );
  }
}
