import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';
import 'package:flutter_4proj_resit/screens/Login/components/background.dart';
import 'package:flutter_4proj_resit/screens/Login/components/or_divider.dart';
import 'package:flutter_4proj_resit/screens/Login/components/provider/google_sign_in.dart';
import 'package:flutter_4proj_resit/screens/Login/components/social_icon.dart';
import 'package:flutter_4proj_resit/screens/SignUp/signup_screen.dart';
import 'package:flutter_4proj_resit/widgets/roundedButton.dart';
import 'package:flutter_4proj_resit/widgets/alreadyHaveAnAccountCheck.dart';
import 'package:flutter_4proj_resit/widgets/roundedInputField.dart';
import 'package:flutter_4proj_resit/widgets/roundedPasswordField.dart';
import 'package:provider/provider.dart';

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
              height: size.height * 0.06,
            ),
            Text("LOGIN"),
            SizedBox(
              height: size.height * 0,
            ),
            Image.asset(
              Config.assets.splashImg,
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0,
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
              height: size.height * 0.02,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Sign In Facebook Button
                // SocialIcon(
                //   iconSrc: Config.icon.facebookIcon,
                //   press: () {},
                // ),
                // Sign In Twitter
                // SocialIcon(
                //   iconSrc: Config.icon.twitterIcon,
                //   press: () {},
                // ),
                // Sign In Google
                SocialIcon(
                  iconSrc: Config.icon.googleIcon,
                  press: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
