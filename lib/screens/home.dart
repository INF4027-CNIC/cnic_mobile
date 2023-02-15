import 'package:cnic/api_state/api_satate.dart';
import 'package:cnic/config/config.dart';
import 'package:cnic/screens/card_ui.dart';
import 'package:cnic/screens/help.dart';
import 'package:cnic/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

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
        barrierDismissible: false,
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
      // backgroundColor: Config.colors.secondColor,
      backgroundColor: Colors.transparent,
      duration: const Duration(minutes: 2),
      padding: const EdgeInsets.all(0),
      content: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Config.colors.secondColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        height: 280,
        child: Column(
          children: [
            Container(
              height: 5,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey[300],
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
            Text(
              "Current code: $_code",
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  fontFamily: "Nunito", fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(
                  fontFamily: "Nunito", fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
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
        barrierDismissible: false,
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
                } else if (codeController.text.length != 13) {
                  return "Code must be 13 characters";
                } else if (!isNumeric(codeController.text)) {
                  return "Code must contain only digits";
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
                hintText: "13 digits expected",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: "Nunito",
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.colors.primaryColor,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          // green top bar
          Container(
            height: 250,
            width: size.width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Config.colors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(25, 255, 255, 255),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(Config.arms).image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const AutoSizeText(
                  "CAMEROON NATIONAL\n IDENTITY CARD",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),

          // rest of the page
          Expanded(
            child: ListView(
              children: [
                // help button
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(80, 158, 158, 158),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .pushReplacementNamed(HelpPage.routeName);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => HelpPage()));
                      print("TM");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.help_outline),
                        SizedBox(width: 15),
                        Text("HOW IT WORKS"),
                      ],
                    ),
                  ),
                ),

                // horizontal line
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 5, left: 20, right: 20),
                  height: 1,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(129, 158, 158, 158),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),

                // text indication
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const AutoSizeText(
                    "Select one of these actions to view the CNI ",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w600,
                    ),
                    minFontSize: 5.0,
                  ),
                ),

                // two methods
                Column(
                  children: [
                    CButton(
                      onPressed: () {
                        scanQRCode();
                      },
                      icon: Icons.qr_code_scanner_outlined,
                      buttonText: "SCAN THE QR Code",
                      buttonText2: "Scan the qr code image",
                      textColor: Config.colors.secondColor,
                      buttonColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),
                    CButton(
                      onPressed: () {
                        getCodeAlert();
                      },
                      icon: Icons.onetwothree_outlined,
                      buttonText: "USE UNIQUE CODE",
                      buttonText2: "Enter the numeric code",
                      textColor: Config.colors.secondColor,
                      buttonColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Config.colors.primaryColor,
        child: Container(
          // color: Config.colors.primaryColor,
          // height: 40,
          height: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text(
              //   "PEACE - WORK - FATHERLAND",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 10,
              //       fontFamily: "Nunito",
              //       fontWeight: FontWeight.w600),
              // ),
              // const SizedBox(height: 5),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 3,
              //       width: 45,
              //       margin:
              //           const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              //       decoration: BoxDecoration(
              //         color: const Color.fromARGB(255, 0, 255, 8),
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //     ),
              //     Container(
              //       height: 3,
              //       width: 45,
              //       margin:
              //           const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              //       decoration: BoxDecoration(
              //         color: Colors.red,
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //     ),
              //     Container(
              //       height: 3,
              //       width: 45,
              //       margin:
              //           const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              //       decoration: BoxDecoration(
              //         color: Colors.yellow,
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 15, 189, 20),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
