import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Config.assets.splashImg),
            Container(
              height: 40,
              width: 184,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Config.colors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Text(
                "Forma-Green",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "CiutadellaRounded-Bd"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
