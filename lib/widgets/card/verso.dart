import 'package:cnic/config/config.dart';
import 'package:cnic/widgets/card/component.dart';
import 'package:flutter/material.dart';

class VersoCard extends StatelessWidget {
  const VersoCard({
    Key? key,
    required this.mere,
    required this.pere,
    required this.sp,
    required this.adresse,
    required this.telephone,
    required this.autorite,
    required this.dateDeliv,
    required this.dateExp,
    required this.poste,
    required this.id,
    required this.id_2,
  }) : super(key: key);

  final String mere;
  final String pere;
  final String sp;
  final String adresse;
  final String telephone;
  final String autorite;
  final String dateDeliv;
  final String dateExp;
  final String poste;
  final String id;
  final String id_2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Config.arms),
          opacity: 0.2,
        ),
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
        children: [],
      ),
    );
  }
}
