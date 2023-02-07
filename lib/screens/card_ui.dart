import 'dart:convert';

import 'package:cnic/config/config.dart';
import 'package:cnic/models/user_model.dart';
import 'package:cnic/screens/home.dart';
import 'package:cnic/widgets/card/recto.dart';
import 'package:cnic/widgets/card/verso.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});
  static const routeName = "card-screens";
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  LocalStorage userCheckedStorage = LocalStorage("saved_user_checked");

  String navbar_username = "";

  // infos du recto
  String nom = "";
  String prenom = "";
  String dateNais = "";
  String lieuNais = "";
  String sexe = '';
  dynamic taille;
  String profession = "";
  int code = 0;
  String photo = "assets/images/pp-tm.jpg";

  // infos du verso
  String pere = "";
  String mere = "";
  String sp = "000000";
  String adresse = "";
  int telephone = 0;
  String autorite = "Martin MABRGA NGUELE";
  String dateDeliv = "20.12.2019";
  String dateExp = "20.12.2029";
  String poste = "CE69";
  int u_id = 0;
  String id_2 = "";

  Future confirmLogout() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // contentPadding: const EdgeInsets.only(bottom: 15),
          title: const Text("Log out ?"),
          content: Container(
            child: const Text(
              "If you disconnect, you will have to provide your 'code' the next time to access your NIC",
              style: TextStyle(
                  fontFamily: 'Nunito', fontWeight: FontWeight.normal),
            ),
          ),
          actions: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Config.colors.primaryColor),
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {
                        logoutNow();
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Logout"),
                    )
                  ],
                ),
                const SizedBox(height: 15),
              ],
            )
          ],
        ),
      );

  void logoutNow() {
    userCheckedStorage.clear();
    print("Logout successfully");
    Navigator.of(context).pushReplacementNamed(Home.routeName);
  }

  void initgetSavedInfo() {
    // var data = userCheckedStorage.getItem('saved_user_checked');
    Map<String, dynamic> data =
        json.decode(userCheckedStorage.getItem('saved_user_checked'));

    if (data.isNotEmpty) {
      User currentUser = User.fromJson(data);
      navbar_username = currentUser.firstname ?? "inconu";

      // infos du recto
      nom = currentUser.firstname ?? "inconu";
      prenom = currentUser.lastname ?? "inconu";
      dateNais = DateTime.fromMillisecondsSinceEpoch(
              currentUser.birthDate ?? "inconu",
              isUtc: true)
          .toString()
          .split(" ")[0];
      lieuNais = currentUser.birthPlace ?? "inconu";
      sexe = currentUser.gender ?? "inconu";
      taille = currentUser.size ?? "inconu";
      profession = currentUser.profession ?? "inconu";
      code = currentUser.code ?? "inconu";
      photo = "assets/images/default-user.png";

      // infos du verso
      pere = currentUser.fathername ?? "inconu";
      mere = currentUser.mothername ?? "inconu";
      sp = "000000";
      adresse = currentUser.address ?? "inconu";
      telephone = currentUser.phone ?? "inconu";
      autorite = "Martin MABRGA NGUELE";
      dateDeliv = currentUser.cniDeliveryDate == null
          ? "inconu"
          : currentUser.cniDeliveryDate.substring(0, 7);
      dateExp = currentUser.cniExpiryDate == null
          ? "inconu"
          : currentUser.cniExpiryDate.substring(0, 7);
      poste = "CE69";
      u_id = currentUser.code ?? "inconu";
      id_2 = currentUser.cniCode ?? "inconu";
    }
  }

  @override
  void initState() {
    super.initState();

    initgetSavedInfo();
  }

  @override
  Widget build(BuildContext context) {
    // // infos du recto
    // String nom = "KANA ZANLEFACK";
    // String prenom = "BLONDELLE";
    // String lieuNais = "DSCHANG";
    // String sexe = 'F';
    // double taille = 1.75;
    // String profession = "ÉTUDIANTE";
    // String photo = "assets/images/pp-tm.jpg";

    // // infos du verso
    // String pere = "PAPA ZANLEFACK";
    // String mere = "MAMA ZANLEFACK";
    // String sp = "880000";
    // String adresse = "YDE - ESSOS";
    // String telephone = "656789174";
    // String autorite = "Martin MABRGA NGUELE";
    // String dateDeliv = "20.12.2019";
    // String dateExp = "20.12.2029";
    // String poste = "CE69";
    // String id = "20190478956321457";
    // String id_2 = "0123456789";

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome $navbar_username",
            style: const TextStyle(
                fontFamily: 'Nunito', fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                confirmLogout();
              },
              icon: const Icon(Icons.logout_rounded),
            ),
            IconButton(
              icon: const Icon(Icons.file_download_outlined),
              onPressed: () {
                // dowload the NIC
              },
            )
          ],
        ),
        body: CrossScroll(
          dimColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: SizedBox(
              width: 379,
              height: 700,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RectoCard(
                      nom: nom,
                      prenom: prenom,
                      dateNais: dateNais,
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
                      u_id: u_id,
                      id_2: id_2,
                    )
                  ],
                ),
              )),
        ));
  }
}
