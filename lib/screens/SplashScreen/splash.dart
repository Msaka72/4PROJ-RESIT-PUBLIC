import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/functions.dart';

class SplashWidget extends StatelessWidget {
  final int time;
  final Widget child, nextPage;

  const SplashWidget(
      {Key? key, this.time = 5, required this.child, required this.nextPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: time), () {
      route(context, nextPage, close: true);
    });
    return child;
  }
}
