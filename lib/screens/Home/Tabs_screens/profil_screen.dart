import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> _userData = FirebaseFirestore.instance
        .collection('Users_Data')
        .doc(user.email)
        .snapshots();
    Size size = MediaQuery.of(context).size;

    return StreamBuilder<DocumentSnapshot>(
      stream: _userData,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var data = snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.54,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: size.height * 0.1,
                        bottom: 20,
                        left: 40,
                        right: 40,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            user.displayName!,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Email: " + user.email!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Status: " + data["status"],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: 30),
                          QrImage(
                            data: user.email!,
                            version: QrVersions.auto,
                            size: size.width * 0.62,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                  top: size.height * 0.02,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: _scan,
                    child: Text("Scan a friend now !"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print(barcode);
      print('I got nothing !');
    } else {
      try {
        var doc = await FirebaseFirestore.instance
            .collection('Users_Data')
            .doc(barcode)
            .get();
        if (doc.exists) {
          var data = doc.data() as Map<String, dynamic>;
          Alert(
                  context: context,
                  title: data["firstName"],
                  desc: data["email"] + "\n\n" + data["status"],
                  image: Image.network(data["image"]))
              .show();
        } else {
          Alert(
                  context: context,
                  title: "Mais je ne te connais pas toi !",
                  desc: "Maintenant au coin !",
                  image: Image.asset(Config.assets.jetejuge))
              .show();
        }
      } catch (ex) {
        Alert(
                context: context,
                title: "Mais je ne te connais pas toi !",
                desc: "Maintenant au coin !",
                image: Image.asset(Config.assets.jetejuge))
            .show();
      }
    }
  }
}
