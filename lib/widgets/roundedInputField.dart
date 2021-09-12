import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/widgets/textFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon
              /*color : XXX, */
              ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
