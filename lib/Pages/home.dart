import 'package:flutter/material.dart';
import 'package:ivr_p2/Pages/call.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body:Container(
        color: Colors.white,
        // height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              // width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: _wave(),
            ),
              Center(

              )
          ],
        ),
      )
    );
  }
  Widget _wave() {
    return WaveWidget(
      config: CustomConfig(
        colors: [
          Colors.black26,
          Colors.black54,
          Colors.white70,
          Colors.white30,
          Colors.white,
        ],
        durations: [35000,25000, 19440, 10800, 6000],
        heightPercentages: [0.20,0.22, 0.25, 0.28, 0.30],
        blur: null,
      ),
      backgroundColor: Colors.blue,
      size: Size(
        double.infinity,
        double.infinity,
      ),
    );
  }

}
