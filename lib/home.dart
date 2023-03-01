import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          FloatingActionButton(onPressed: (){
            FirebaseAuth.instance.signOut()
                .then((value) {
                  Navigator.of(context).pop();
            })
                .catchError((e){
                  print(e);
            });
          },
          child: Text("log out"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,)
        ],
      ),
    );
  }
}
