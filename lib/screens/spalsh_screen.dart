import 'dart:async';

import 'package:cnic/config/config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Config.colors.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Config.logo),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Loading",
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 100,
                child: LinearProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
