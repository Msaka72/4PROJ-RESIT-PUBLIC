import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/widgets/textFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
          ),
          suffixIcon: Icon(
            Icons.visibility,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
