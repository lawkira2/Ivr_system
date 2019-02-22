import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ivr_p2/Pages/home.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  String _email, _password;
  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.cyan,
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text("Feel Free to\nRegister here",
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
                      hintText: "Email Address",
                      hintStyle: TextStyle(
                        color: Colors.white70
                      ),
                    prefixIcon: Icon(Icons.email,color: Colors.white,)
                  ),
                  style: TextStyle(
                    fontSize: 18.0
                  ),

                ),
                SizedBox(
                  height: 24.0,
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
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0
                    ),
                    prefixIcon: Icon(Icons.lock,color: Colors.white70,)
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 48.0,
                ),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius:BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color:Colors.green ,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: Signup,
                      child: Center(
                        child: Text(
                          'SIGNUP',
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

  Future <void> Signup() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}

