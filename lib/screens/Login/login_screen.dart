import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/screens/Login/components/body.dart';
import 'package:flutter_4proj_resit/screens/Home/tabs.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Home();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something Went Wrong !"),
              );
            } else {
              return Body();
            }
          },
        ),
      );
}
