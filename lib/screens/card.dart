import 'dart:ffi';
import 'dart:math';

import 'package:cnic/config/config.dart';
import 'package:cnic/widgets/card/recto.dart';
import 'package:cnic/widgets/card/verso.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  const CardUI({super.key});

  @override
  Widget build(BuildContext context) {
    // infos du recto
    String nom = "KANA ZANLEFACK";
    String prenom = "BLONDELLE";
    String lieuNais = "DSCHANG";
    String sexe = 'F';
    double taille = 1.75;
    String profession = "ÉTUDIANTE";
    String photo = "assets/images/pp-tm.jpg";

    // infos du verso
    String pere = "PAPA ZANLEFACK";
    String mere = "MAMA ZANLEFACK";
    String sp = "880000";
    String adresse = "YDE - ESSOS";
    String telephone = "656789174";
    String autorite = "Martin MABRGA NGUELE";
    String dateDeliv = "20.12.2019";
    String dateExp = "20.12.2029";
    String poste = "CE69";
    String id = "20190478956321457";
    String id_2 = "0123456789";

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
        body: CrossScroll(
          child: SizedBox(
              width: 410,
              height: 800,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    RectoCard(
                      nom: nom,
                      prenom: prenom,
                      lieuNais: lieuNais,
                      sexe: sexe,
                      taille: taille,
                      profession: profession,
                      photo: photo,
                    ),
                    const SizedBox(height: 10),
                    VersoCard(
                      mere: mere,
                      pere: pere,
                      sp: sp,
                      adresse: adresse,
                      telephone: telephone,
                      autorite: autorite,
                      dateDeliv: dateDeliv,
                      dateExp: dateExp,
                      poste: poste,
                      id: id,
                      id_2: id_2,
                    )
                  ],
                ),
              )),
        ));
  }
}
