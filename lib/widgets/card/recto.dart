import 'package:cnic/config/config.dart';
import 'package:cnic/widgets/card/components.dart';
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
    required this.dateNais,
  }) : super(key: key);

  final dynamic nom;
  final dynamic prenom;
  final dynamic dateNais;
  final dynamic lieuNais;
  final dynamic sexe;
  final dynamic taille;
  final dynamic profession;
  final dynamic photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
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
                value: "$nom",
              ),
              InfoTile(
                label: "PRÉNOMS/GIVEN NAMES",
                value: "$prenom",
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTile(
                        label: "DATE DE NAISSANCE/DATE OF BIRTH",
                        value: "$dateNais",
                      ),
                      InfoTile(
                        label: "LIEU DE NAISSANCE/PLACE OF BIRTH",
                        value: "$lieuNais",
                      ),
                      Row(
                        children: [
                          InfoTile(
                            label: "SEXE/SEX",
                            value: "$sexe",
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
                        value: "$profession",
                      ),
                    ],
                  ),
                  const SizedBox(width: 25),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cnic.onrender.com/" + photo.toString()),
                        fit: BoxFit.contain,
                      ),
                      // image: DecorationImage(
                      //   image: AssetImage(photo),
                      //   fit: BoxFit.contain,
                      // ),
                      // border: Border.all(
                      //   color: Config.colors.primaryColor,
                      //   width: 1
                      // ),
                      // color: Colors.white,
                      color: Colors.transparent,
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
