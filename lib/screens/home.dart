import 'package:cnic/config/config.dart';
import 'package:cnic/screens/card_ui.dart';
import 'package:cnic/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late TextEditingController controller;
  final TextEditingController codeController = TextEditingController();

  final _formCode = GlobalKey<FormState>();
  String _code = "";

  var scannedQRCode = "QR Code result";

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
                scanQRCode();
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const CardUI()));
              },
              icon: Icons.qr_code_scanner_outlined,
              buttonText: "Scan the QR Code",
              buttonText2: "to view your CNI",
              textColor: Config.colors.secondColor,
              buttonColor: Colors.transparent,
              borderColor: Colors.transparent,
              borderRadius: 10,
            ),
            CButton(
              onPressed: () {
                getCodeAlert();
              },
              icon: Icons.abc_outlined,
              buttonText: "Use your Code",
              buttonText2: "to view your CNI",
              textColor: Config.colors.secondColor,
              buttonColor: Colors.transparent,
              borderColor: Colors.transparent,
            )
          ],
        )
      ],
    ));
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );

      if (!mounted || qrCode == "-1") return;

      setState(() {
        scannedQRCode = qrCode;
      });
      // verify the code by sending to the server
      // ................

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CardUI()));
      // print("QRCode_Result:--");
      // print(qrCode);
    } on PlatformException {
      scannedQRCode = "Failed to scan QR Code!";
    }
  }

  Future getCodeAlert() => showDialog(
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
            ],
          ));

  void submit() {
    print(_code);
    Navigator.of(context).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CardUI()));
  }
}
