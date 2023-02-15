import 'package:cnic/config/config.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});
  static const routeName = "help-screens";

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_outlined)),
        title: const Text(
          "How It Works",
          style: TextStyle(fontFamily: "Nunito"),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Config.colors.primaryColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              children: [
                const Text(
                  "Follow these 3 steps to get a digital id card !",
                  style: TextStyle(
                      fontFamily: "Nunito", fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                cardHelp(
                  Config.register,
                  "1. Register at office",
                  "Follow these 3 steps to get a digital id card !",
                ),
                const SizedBox(height: 40),
                cardHelp(
                  Config.qrCode,
                  "2. Get back a QR Code and Unique ID",
                  "The QR Code and ID are unique and you will use it view the corresponding ID Card. Keep it private !",
                ),
                const SizedBox(height: 40),
                cardHelp(
                  Config.card,
                  "3. Use a code (qr or numeric) to view an ID Card",
                  "Now you your can you can authenticate",
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
          height: 50,
          // height: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "PEACE - WORK - FATHERLAND",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 45,
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 255, 8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 45,
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 45,
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 3,
              //       width: size.width * 0.33,
              //       decoration: const BoxDecoration(
              //         color: Color.fromARGB(255, 15, 189, 20),
              //       ),
              //     ),
              //     Container(
              //       height: 3,
              //       width: size.width * 0.33,
              //       decoration: const BoxDecoration(
              //         color: Colors.red,
              //       ),
              //     ),
              //     Container(
              //       height: 3,
              //       width: size.width * 0.33,
              //       decoration: const BoxDecoration(
              //         color: Colors.yellow,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Container cardHelp(String imgPath, String title, String description) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            imgPath,
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Nunito", fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(description,
              style: const TextStyle(fontFamily: "Nunito"),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
