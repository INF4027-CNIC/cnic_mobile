import 'dart:convert';

import 'package:cnic/config/config.dart';
import 'package:cnic/models/user_model.dart';
import 'package:cnic/widgets/card/recto.dart';
import 'package:cnic/widgets/card/verso.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String photo = "https://i.pravatar.cc/150?img=35";
  //String photo = "assets/images/pp-tm.jpg";

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
  int userid = 0;
  String id_2 = "";

  Future confirmLogout() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // contentPadding: const EdgeInsets.only(bottom: 15),
          title: const Text("Log out ?"),
          content: SizedBox(
            child: const Text(
              "If you disconnect, you will have to provide your 'code' the next time to access your NIC",
              style:
                  TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w600),
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
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {
                        logoutNow();
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
              ],
            )
          ],
        ),
      );

  void logoutNow() async {
    userCheckedStorage.clear();
    print("Logout successfully");
    // Restart.restartApp(webOrigin: Home.routeName);
    // Navigator.pushReplacementNamed(context, Home.routeName);
    // SystemNavigator.pop();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );
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
      photo = currentUser.avatar ?? "https://i.pravatar.cc/150?img=35";
      // photo = "assets/images/pp-tm.jpg";

      // infos du verso
      pere = currentUser.fathername ?? "inconu";
      mere = currentUser.mothername ?? "inconu";
      sp = "000000";
      adresse = currentUser.address ?? "inconu";
      telephone = currentUser.phone ?? "inconu";
      dateDeliv = currentUser.cniDeliveryDate == null
          ? "inconu"
          : currentUser.cniDeliveryDate.substring(0, 7);
      dateExp = currentUser.cniExpiryDate == null
          ? "inconu"
          : currentUser.cniExpiryDate.substring(0, 7);
      poste = "CE69";
      userid = currentUser.code ?? "inconu";
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          // "Welcome $navbar_username",
          "Welcome",
          style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w600),
        ),
        backgroundColor: Config.colors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              confirmLogout();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 2),
          // IconButton(
          //   icon: const Icon(
          //     Icons.file_download_outlined,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // dowload the NIC
          //   },
          // )
        ],
      ),
      body: CrossScroll(
        dimColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: SizedBox(
            width: 380,
            height: 690,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 5),
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
                    userId: userid,
                    id_2: id_2,
                  )
                ],
              ),
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Config.colors.primaryColor,
        child: SizedBox(
          height: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 15, 189, 20),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: size.width * 0.33,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
