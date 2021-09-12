import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const double defaultHeight = 40;
const double defaultWidth = 40;

class Config {
  static final colors = _Color();
  static final assets = _Asset();
  static final icon = _Icon();
  static final background = _Background();
}

//Couleurs utilisées pour le design de l'application
class _Color {
  //Couleurs pour le thème claire
  final primaryColor = Color(0xFF009B31);
  final primaryTextColor = Color(0xFF000000);
  //Couleurs pour le thème sombre
  final secondaryColor = Color(0xFF3D3D3D);
  final secondaryTextColor = Color(0xFF300070);
}

//Images utilisées pour le desing de l'application
class _Asset {
  //Splashscreen :
  //Splashscreen image (l'ampoule ecolo)
  final splashImg = "assets/image/ampoule_ecolo.png";

  final jetejuge = "assets/image/je te juge.png";
}

//Icons utilisées pour le desing de l'application
class _Icon {
  //Default None icon
  //(utilisée pour le debug et attribution d'icons temporaires) :
  final defaultIcon = "assets/image/icons/none_icon.png";
  final facebookIcon = "assets/image/icons/facebook.png";
  final twitterIcon = "assets/image/icons/twitter.png";
  final googleIcon = "assets/image/icons/google-plus.png";
}

//Background utilisées pour le desing de l'application
class _Background {
  final mainBackground = "";
  final secoundBackground = "";
}
