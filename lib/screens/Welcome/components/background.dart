import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 60,
            left: 0,
            child: Image.asset(
              Config.assets.splashImg,
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Image.asset(
              Config.assets.splashImg,
              width: size.width * 0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
