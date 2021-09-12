import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';
import 'package:flutter_4proj_resit/screens/Login/login_screen.dart';
import 'package:flutter_4proj_resit/screens/SignUp/components/background.dart';
import 'package:flutter_4proj_resit/widgets/RoundedButton.dart';
import 'package:flutter_4proj_resit/widgets/alreadyHaveAnAccountCheck.dart';
import 'package:flutter_4proj_resit/widgets/roundedInputField.dart';
import 'package:flutter_4proj_resit/widgets/roundedPasswordField.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SIGNUP"),
            SizedBox(
              height: size.height * 0.01,
            ),
            Image.asset(
              Config.assets.splashImg,
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: 'Your email',
              onChanged: (String value) {},
            ),
            RoundedPasswordField(
              onChanged: (String value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
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
          ],
        ),
      ),
    );
  }
}
