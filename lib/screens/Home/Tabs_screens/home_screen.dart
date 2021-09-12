import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final Stream<QuerySnapshot> _userData =
      FirebaseFirestore.instance.collection("Sponsor_Data").snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _userData,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return sponsorContainer(size, data);
              }).toList(),
            ), 
          ),
        );
      },
    );
  }

  Widget sponsorContainer(size, data) => Container(
        height: 170,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 15,
          bottom: 0,
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade100,
              Colors.green.shade500,
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sponsor : " + data["title"],
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Code Promo : " + data["codepromo"],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              child: Image.network(
                data["logo"],
                height: size.height * 0.1,
              ),
            ),
          ],
        ),
      );
}
