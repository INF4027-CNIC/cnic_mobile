import 'package:cnic/api_state/api_satate.dart';
import 'package:cnic/config/config.dart';
import 'package:cnic/screens/card_ui.dart';
import 'package:cnic/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = "home-screens";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late TextEditingController controller;
  final TextEditingController codeController = TextEditingController();

  final _formCode = GlobalKey<FormState>();
  String _code = "";

  // send code to the server for checking
  void _isChecking() async {
    _loading();

    // sending code to the server for checking
    String isChecking =
        await Provider.of<ApiState>(context, listen: false).checkingCode(_code);
    switch (isChecking) {
      case "checked":
        codeController.clear();
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(CardPage.routeName);
        break;
      case "not checked":
        print("User Not Found With This Code");
        Navigator.of(context).pop();
        _displayError(
            "No User Found With This Code, Please change the code and try again !");
        break;
      default:
        print("Error to send");
        Navigator.of(context).pop();
        _displayError(
            "Server is not available now, Please check your network connection or try again later !");
    }
  }

  // loading when checking the code
  Future _loading() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          scrollable: true,
          content: Column(
            children: const [
              SizedBox(height: 20),
              CircularProgressIndicator(),
              SizedBox(height: 15),
              Text(
                "Loading, please wait...",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );

  // display error after checking the code
  _displayError(String message) {
    final snackBar = SnackBar(
      backgroundColor: Config.colors.secondColor,
      duration: const Duration(seconds: 10),
      content: Container(
        height: 280,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Get.isDarkMode ? Colors.grey[500] : Colors.grey[300],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Config.logo),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 10),
                const AutoSizeText("Cameroon National \nIdentity Card",
                    style: TextStyle(fontSize: 20, fontFamily: "Nunito"))
              ],
            ),
            const SizedBox(height: 25),
            Text("Current code: $_code",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: "Nunito", fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),
            Text(message,
                style: const TextStyle(
                    fontFamily: "Nunito", fontWeight: FontWeight.normal)),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Text("OK"),
            )
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // get the code (via a form) and and call "_isChecking" method
  Future getCodeAlert() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Enter Code"),
          content: Form(
            key: _formCode,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: codeController,
              autofocus: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a code please";
                } else if (codeController.text.length < 13) {
                  return "Code must be 13 characters";
                }
              },
              onSaved: (newValue) {
                // _code = newValue!;
                setState(() {
                  _code = newValue!;
                });
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
                var isValid = _formCode.currentState!.validate();
                if (!isValid) {
                  return;
                }
                _formCode.currentState!.save();
                print("Code obtenu: $_code");
                Navigator.of(context).pop();
                _isChecking();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Config.colors.primaryColor),
              child: const Text("Next"),
            )
          ],
        ),
      );

  // scan the QR Code and call "_isChecking" method
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
        _code = qrCode;
      });

      print("Code obtenu: $_code");

      // verify the code by sending to the server
      _isChecking();
    } on PlatformException {
      _code = "Failed to scan QR Code!";
    }
  }

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
                "Welcome to this application. Please select one of these actions to view your CNI ",
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
              buttonText: "Use your U. Code",
              buttonText2: "to view your CNI",
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
