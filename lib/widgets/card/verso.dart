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
      width: 380,
      padding: const EdgeInsets.all(15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTile(label: "PÈRE/FATHER", value: pere),
                  InfoTile(label: "MÈRE/MOTHER", value: mere),
                  const SizedBox(height: 7),
                  InfoTile(label: "AUTORITÉ/AUTHORITY", value: autorite),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTile(label: "S.P/S.M", value: sp),
                  InfoTile(label: "ADRESSE/ADDRESS", value: adresse),
                  Text(
                    telephone,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTile(
                      label: "DATE DE DELIVRANCE/\nDATE OF ISSUE",
                      value: dateDeliv),
                  InfoTile(
                      label: "DATE D\'EXPIRATION/\nDATE OF EXPIRY",
                      value: dateExp),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTile(
                      label: "POSTE D\'IDENTIFICATION/\nIDENTIFICATION POST",
                      value: poste),
                  InfoTile(
                      label: "IDENTIFIANT UNIQUE/\nUNIQUE IDENTIFIER",
                      value: id),
                ],
              ),
            ],
          ),
          const SizedBox(height: 7),
          Center(child: Text(id_2)),
        ],
      ),
    );
  }
}
