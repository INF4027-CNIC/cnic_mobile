import 'package:cnic/config/config.dart';
import 'package:cnic/widgets/card/component.dart';
import 'package:flutter/material.dart';

class RectoCard extends StatelessWidget {
  const RectoCard({
    Key? key,
    required this.nom,
    required this.prenom,
    required this.lieuNais,
    required this.sexe,
    required this.taille,
    required this.profession,
    required this.photo,
  }) : super(key: key);

  final String nom;
  final String prenom;
  final String lieuNais;
  final String sexe;
  final double taille;
  final String profession;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
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
              InfoTile(
                label: "NOM/SURNAME",
                value: nom,
              ),
              InfoTile(
                label: "PRÉNOMS/GIVEN NAMES",
                value: prenom,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTile(
                        label: "LIEU DE NAISSANCE/PLACE OF BIRTH",
                        value: lieuNais,
                      ),
                      Row(
                        children: [
                          InfoTile(
                            label: "SEXE/SEX",
                            value: sexe,
                          ),
                          const SizedBox(width: 15),
                          InfoTile(
                            label: "TAILLE/HEIGHT",
                            value: "$taille",
                          ),
                        ],
                      ),
                      InfoTile(
                        label: "PROFESSION/OCCUPATION",
                        value: profession,
                      ),
                      const InfoTile(
                        label: "SIGNATURE",
                        value: "",
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(photo),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}