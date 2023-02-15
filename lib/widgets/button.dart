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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(
        //     // color: Config.colors.secondColor,
        //     ),
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Config.colors.primaryColor,
              ),
              height: 60,
              width: 60,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    buttonText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 17,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 5),
                  AutoSizeText(
                    buttonText2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
