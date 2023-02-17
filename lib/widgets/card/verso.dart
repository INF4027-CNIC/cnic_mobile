import 'package:cnic/config/config.dart';
import 'package:cnic/widgets/card/components.dart';
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
    required this.u_id,
    required this.id_2,
  }) : super(key: key);

  final dynamic mere;
  final dynamic pere;
  final dynamic sp;
  final dynamic adresse;
  final dynamic telephone;
  final dynamic autorite;
  final dynamic dateDeliv;
  final dynamic dateExp;
  final dynamic poste;
  final dynamic u_id;
  final dynamic id_2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 365,
      // padding: const EdgeInsets.only(left: 15, top: 15, right: 10, bottom: 15),
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
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 121.5,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(50, 15, 189, 21),
                ),
              ),
              Container(
                height: 80,
                width: 121.5,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(50, 244, 67, 54),
                ),
              ),
              Container(
                height: 80,
                width: 121.5,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(90, 255, 235, 59),
                ),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 15, top: 15, right: 10, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoTile(label: "PÈRE/FATHER", value: "$pere"),
                        const SizedBox(height: 7),
                        InfoTile(label: "MÈRE/MOTHER", value: "$mere"),
                      ],
                    ),
                    // const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(60, 46, 170, 50),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Text(
                        "$u_id",
                        style: const TextStyle(
                          color: Color.fromARGB(131, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      // child: InfoTile(label: "", value: "$u_id"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoTile(
                        label: "ADRESSE/ADDRESS",
                        value: "$adresse\n$telephone"),
                    InfoTile(
                        label: "DATE DE DELIVRANCE/\nDATE OF ISSUE",
                        value: "$dateDeliv"),
                    InfoTile(
                        label: "DATE D\'EXPIRATION/\nDATE OF EXPIRY",
                        value: "$dateExp"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // InfoTile(
                    //     label: "IDENTIFIANT UNIQUE/\nUNIQUE IDENTIFIER",
                    //     value: "$u_id"),
                    InfoTile(
                        label: "POSTE D\'IDENTIFICATION/\nIDENTIFICATION POST",
                        value: "$poste"),
                    InfoTile(label: "AUTORITÉ/AUTHORITY", value: "$autorite"),
                  ],
                ),
                const SizedBox(height: 7),
                Center(
                    child: Text(
                  "$id_2",
                  style: const TextStyle(fontSize: 10),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
