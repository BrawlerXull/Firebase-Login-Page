import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  String password="";
  String email="";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(decoration: InputDecoration(labelText: "Email"),
          onChanged: (value){
            setState(() {
              email=value;
            });
          },
          ),
          TextField(decoration: InputDecoration(labelText: "Password"),
            onChanged: (value){
              setState(() {
                password=value;
              });
            },
            obscureText: true,
          ),
          FloatingActionButton(
            onPressed: (){
            FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
                .then((FirebaseUser) {
              Navigator.pushNamed(context, "/home");
            })
                .catchError((e){
              print(e);
            });
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text("Sign in"),),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, "/signup");
            },
            child: Text("Sign up"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(),
          ),
        ],
      ),
    );
  }
}

