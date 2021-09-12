import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';
import 'package:flutter_4proj_resit/screens/SignUp/signup_screen.dart';
import 'package:flutter_4proj_resit/screens/Login/login_screen.dart';
import 'package:flutter_4proj_resit/screens/Welcome/components/background.dart';
import 'package:flutter_4proj_resit/widgets/roundedButton.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              // Sert juste a positionner les autres éléments correctement
              height: size.height * 0.1,
            ),
            Text(
              "BIENVENUE CHEZ FORMA-GREEN",
            ),
            SizedBox(
              // Sert juste a positionner les autres éléments correctement
              height: size.height * 0.02,
            ),
            Image.asset(
              Config.assets.splashImg,
              height: size.height * 0.45,
            ),
            RoundedButton(
              text: 'LOGIN WITH ...',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'SIGN UP WITH MAIL',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
