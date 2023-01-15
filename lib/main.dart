import 'package:cnic/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cameroon National Id Card",
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 1, 36, 3),
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
