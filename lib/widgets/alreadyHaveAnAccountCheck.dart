import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Already have an account ? " : "Don't have an account ? ",
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign In" : "Sign Up",
          ),
        ),
      ],
    );
  }
}
