import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/home.dart';
class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:  <String,WidgetBuilder>{
        "/home":(BuildContext context) => Home()
      },
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.tealAccent
          ),

          padding: EdgeInsets.all(40.0),
          child: Form(
            key: _formkey,
            child: ListView(

              
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                 Text("Fill Info To \nSeek Inside",
                  textAlign:TextAlign.left ,
                    style: TextStyle(
                    fontSize: 45.0,
                    fontFamily: "Cursive",
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(
              height: 60.0,),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'please type Email';
                    }
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                      hintText: "Email",
                    prefixIcon: Icon(Icons.email,color: Colors.white,),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  ),
                    style: TextStyle(color: Colors.white,
                    fontSize: 20.0),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                  ),
                  height: 1.0,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Password need to be atleast 6 character';
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock,color: Colors.white,)
                  ),
                  style: TextStyle(color: Colors.white,
                      fontSize: 20.0),
                  obscureText: true,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius:BorderRadius.circular(20.0),
                    shadowColor: Colors.deepOrangeAccent,
                    color:Colors.deepOrange ,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: signIn,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Future <void> signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pushNamed("/home");
      } catch (e) {
        print(e.message);
      }
    }
  }
}
