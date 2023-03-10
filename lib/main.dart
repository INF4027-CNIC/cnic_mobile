import 'package:cnic/api_state/api_satate.dart';
import 'package:cnic/config/config.dart';
import 'package:cnic/screens/card_ui.dart';
import 'package:cnic/screens/error_page.dart';
import 'package:cnic/screens/help.dart';
import 'package:cnic/screens/home.dart';
import 'package:cnic/screens/spalsh_screen.dart';
import 'package:cnic/screens/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    LocalStorage userCheckedStorage = LocalStorage("saved_user_checked");

    return ChangeNotifierProvider(
      create: (context) => ApiState(),
      child: MaterialApp(
        title: "Cameroon National Id Card",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Config.colors.primaryColor,
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: userCheckedStorage.ready,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: SplashScreen(),
                ),
              );
            }
            if (userCheckedStorage.getItem("saved_user_checked") == null) {
              return const Home();
            }
            return const CardPage();
          },
        ),
        routes: {
          Home.routeName: (context) => const Home(),
          CardPage.routeName: (context) => const CardPage(),
          ErrorPage.routeName: (context) => const ErrorPage(),
          HelpPage.routeName: (context) => const HelpPage(),
          TestPage.routrName: (context) => const TestPage(),
        },
      ),
    );
  }
}
