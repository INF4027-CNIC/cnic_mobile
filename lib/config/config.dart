import 'package:flutter/painting.dart';

class Config {
  static final colors = _Color();
  static final assets = _Asset();
  static String flag = "assets/images/flag.jpg";
  static String arms = "assets/images/Coat_of_arms_of_Cameroon.svg.png";
}

class _Color {
  final primaryColor = Color(0xFF009D33);
  final secondColor = Color.fromARGB(255, 0, 0, 0);
  final thirdColor = Color.fromARGB(255, 255, 255, 255);
  final bgTextColor = Color(0xFFDFFFCA);
}

class _Asset {
  final plat = "assets/images/plat.png";
  final logo = "assets/images/logo_splash.png";
  final flag = "assets/images/flag.jpg";
}
