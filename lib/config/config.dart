import 'package:flutter/painting.dart';

class Config {
  static final colors = _Color();
  static final assets = _Asset();
}

class _Color {
  final primaryColor = Color.fromARGB(255, 15, 116, 25);
  final secondColor = Color.fromARGB(255, 0, 0, 0);
  final thirdColor = Color.fromARGB(255, 255, 255, 255);
}

class _Asset {
  final plat = "assets/images/plat.png";
  final logo = "assets/images/logo_splash.png";
  final flag = "assets/images/armoiries_cmr.svg";
}
