import 'dart:math';

import 'package:cnic/config/config.dart';
import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  const CardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome Blondelle",
            style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.file_download_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  // color: Colors.grey,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          LeftText(
                            text: "NATIONAL IDENTITY CARD",
                            color: Colors.red,
                          ),
                          SizedBox(height: 20),
                          LeftText(
                            text: "CARTE NATIONALE D'IDENTITÉ",
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Config.flag,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(width: 15),
                              titleRepublic(),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const InfoTile(
                            label: "NOM/SURNAME",
                            value: "KANA ZANLEFACK",
                          ),
                          const InfoTile(
                            label: "PRÉNOMS/GIVEN NAMES",
                            value: "BLONDELLE",
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const InfoTile(
                                    label: "LIEU DE NAISSANCE/PLACE OF BIRTH",
                                    value: "DSCHANG",
                                  ),
                                  Row(
                                    children: const [
                                      InfoTile(
                                        label: "SEXE/SEX",
                                        value: "F",
                                      ),
                                      SizedBox(width: 15),
                                      InfoTile(
                                        label: "TAILLE/HEIGHT",
                                        value: "1,75",
                                      ),
                                    ],
                                  ),
                                  const InfoTile(
                                    label: "PROFESSION/OCCUPATION",
                                    value: "ÉTUDIANTE",
                                  ),
                                  const InfoTile(
                                    label: "SIGNATURE",
                                    value: "",
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                "assets/images/pp-tm.jpg",
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }

  Column titleRepublic() {
    return Column(
      children: [
        Text(
          "RÉPUBLIQUE DU CAMEROUN",
          style: TextStyle(
            color: Colors.orange[900],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        Text(
          "REPUBLIC OF CAMEROON",
          style: TextStyle(
            color: Colors.orange[900],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class LeftText extends StatelessWidget {
  const LeftText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Config.colors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 9.5,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
