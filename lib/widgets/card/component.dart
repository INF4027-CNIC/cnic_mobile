import 'package:cnic/config/config.dart';
import 'package:flutter/material.dart';

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
