import 'dart:math';

import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  const CardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              Spacer(),
              Text(
                "Blondelle",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              Spacer(),
              Text(
                "download",
                style: TextStyle(fontSize: 10, color: Colors.blue),
              ),
              SizedBox(width: 5)
            ],
          ),
          AspectRatio(
            aspectRatio: (5 / 3),
            child: Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 10),
              padding: EdgeInsets.only(top: 50),
              //color: Colors.grey,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 231, 231, 231)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Transform.rotate(
                        angle: -pi / 2,
                        alignment: Alignment.center,
                        child: Container(
                          //color: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "CARTE NATIONNAL D'IDENTITE",
                                style:
                                    TextStyle(fontSize: 7, color: Colors.blue),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "NATIONNAL IDENTITY CARD",
                                style:
                                    TextStyle(fontSize: 7, color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 55,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("REPUBLIQUE DU CAMEROUN",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold)),
                              Text("REPUBLIC OF CAMEROON",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("REPUBLIQUE DU CAMEROUN",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                          Text("REPUBLIC OF CAMEROON",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("REPUBLIQUE DU CAMEROUN",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                          Text("REPUBLIC OF CAMEROON",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("REPUBLIQUE DU CAMEROUN",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                          Text("REPUBLIC OF CAMEROON",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("REPUBLIQUE DU CAMEROUN",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                          Text("REPUBLIC OF CAMEROON",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
