import 'package:cnic/config/config.dart';
import 'package:cnic/screens/card.dart';
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
  late TextEditingController controller;
  final TextEditingController codeController = TextEditingController();

  final _formCode = GlobalKey<FormState>();
  String _code = "";

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 191, 213, 180),
              ),
              child: const AutoSizeText(
                "Welcome to this application. Please select of these actions to view your CNI ",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                ),
                minFontSize: 5.0,
                textAlign: TextAlign.center,
              ),
            ),
            CButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ScanPage()));
                //scanConnexion();
              },
              icon: Icons.qr_code_scanner_outlined,
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
              icon: Icons.abc_outlined,
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
            title: const Text("Enter Code"),
            content: Form(
              key: _formCode,
              child: TextFormField(
                controller: codeController,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter a code please";
                  }
                },
                onSaved: (newValue) {
                  _code = newValue!;
                },
                decoration: InputDecoration(
                  focusColor: Config.colors.primaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Config.colors.primaryColor,
                      width: 1.0,
                    ),
                  ),
                  labelText: "Enter your code",
                  hintText: "Enter your code...",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (_formCode.currentState!.validate()) {
                    _formCode.currentState!.save();
                    codeController.clear();
                    submit();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Config.colors.primaryColor),
                child: const Text("NEXT"),
              )
              // TextButton(onPressed: submit, child: const Text("Save")),
            ],
          ));

  void submit() {
    print(_code);
    Navigator.of(context).pop();
  }
}
