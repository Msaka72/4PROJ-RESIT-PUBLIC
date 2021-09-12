import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final VoidCallback press;
  const SocialIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Config.colors.primaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconSrc,
          cacheHeight: 20,
          cacheWidth: 20,
        ),
      ),
    );
  }
}
