import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final Stream<QuerySnapshot> _mapMarkersStream =
      FirebaseFirestore.instance.collection("Map_Markers").snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _mapMarkersStream,
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
                return parcListContainer(size, data);
              }).toList(),
            ),
          ),
        );
      },
      // return ListView(
      //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
      //     Map<String, dynamic> data =
      //         document.data()! as Map<String, dynamic>;
      //     return ListTile(
      //       title: Text(data["title"]),
      //       subtitle: Text(data["snippet"]),
      //       onTap: () {},
      //     );
      //   }).toList(),
      // );
    );
  }

  Widget parcListContainer(size, data) => Container(
        height: 80,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 10,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data["title"],
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              data["snippet"],
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
}
