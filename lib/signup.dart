
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
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
          SizedBox(height: 30,),
          SizedBox(
            width: 100,
            child: FloatingActionButton(onPressed: (){
              _auth.createUserWithEmailAndPassword(email: email, password: password)
                  .then((signedInUser){
                    _firestore.collection("users")
                      .add({'email' : email, 'pass' : password,})
                    .then((value){
                      if(signedInUser!=null){
                        Navigator.pushNamed(context, "/home");
                      }
                    })
                    .catchError((e){
                      print(e);
                    });
              })
                  .catchError((e){
                    print(e);
              });

            },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: Text("Register"),
              shape: RoundedRectangleBorder(),
            ),
          )
        ],
      ),
    );
  }
}







//FloatingActionButton(
//             onPressed: ()async{
//               try{
//                 final newuser=await _auth.createUserWithEmailAndPassword(
//                   email:email,
//                   password:password
//                 );
//                 if(newuser!=null){
//                   Navigator.pushNamed(context, "/home");
//                 }
//               }
//               catch(e){
//                 print(e);
//               }
//             },
//             child: Text("Sign up"),
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.black,
//             shape: RoundedRectangleBorder(),
//           )