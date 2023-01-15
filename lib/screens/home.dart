import 'package:cnic/config/config.dart';
import 'package:cnic/screens/card.dart';
import 'package:cnic/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController controller;
  final TextEditingController codeController = TextEditingController();

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
              child: const AutoSizeText(
                "Welcome to this application. Please select of these actions to view your CNI ",
                style: TextStyle(fontSize: 25.0),
                minFontSize: 5.0,
              ),
            ),
            CButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CardUI()));
                //scanConnexion();
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
                scanConnexion();
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

  Future scanConnexion() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Connexion via code"),
            content: TextFormField(
              controller: codeController,
              autofocus: true,
              decoration: InputDecoration(
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                labelText: "Enter your code",
                hintText: "Enter your code",
                hintStyle: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            actions: [TextButton(onPressed: submit, child: const Text("Save"))],
          ));

  void submit() {
    Navigator.of(context).pop();
  }
}
