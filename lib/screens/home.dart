import 'package:cnic/config/config.dart';
import 'package:cnic/screens/code.dart';
import 'package:cnic/screens/scan.dart';
import 'package:cnic/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 191, 213, 180),
              child: AutoSizeText(
                "Welcome to this application. Please select of these actions to view your CNI ",
                style: TextStyle(fontSize: 25.0),
                minFontSize: 5.0,
              ),
            ),
            CButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Scan()));
              },
              icon: Icons.camera_alt_outlined,
              buttonText: "Scan the QR Code",
              buttonText2: "To view your CNI",
              textColor: Config.colors.secondColor,
              buttonColor: Colors.transparent,
              borderColor: Colors.transparent,
              borderRadius: 10,
            ),
            CButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Code()));
              },
              icon: Icons.camera_alt_outlined,
              buttonText: "Use your Code",
              buttonText2: "To view your CNI",
              textColor: Config.colors.secondColor,
              buttonColor: Colors.transparent,
              borderColor: Colors.transparent,
            ),
          ],
        )
      ],
    ));
  }
}
