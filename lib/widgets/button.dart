import 'package:auto_size_text/auto_size_text.dart';
import 'package:cnic/config/config.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  VoidCallback onPressed;
  Color? buttonColor;
  double? borderRadius;
  Color? textColor;
  IconData icon;
  String buttonText;
  String buttonText2;

  Color? borderColor;

  CButton({
    required this.onPressed,
    this.borderRadius,
    this.borderColor,
    this.buttonColor,
    this.textColor,
    required this.icon,
    required this.buttonText,
    required this.buttonText2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
          color: buttonColor ?? Config.colors.primaryColor,
          border: Border.all(
            color: borderColor ?? Config.colors.secondColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Container(
                child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Config.colors.primaryColor,
                  ),
                  height: 70,
                  width: 70,
                  child: Icon(
                    icon,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      AutoSizeText(
                        buttonText,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        minFontSize: 5.0,
                      ),
                      AutoSizeText(
                        buttonText2,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        minFontSize: 5.0,
                      ),
                    ],
                  ),
                )
              ],
            )),
          )),
    );
  }
}
