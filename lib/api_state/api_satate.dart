import 'dart:convert';

import 'package:cnic/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class ApiState with ChangeNotifier {
  User? _currentUser;

  LocalStorage userCheckedStorage = LocalStorage("saved_user_checked");

  String apiLink = "https://cnic.onrender.com";

  // send code to server for checking
  Future<String> checkingCode(String code) async {
    try {
      var url = Uri.parse("$apiLink/users/find-by-code/$code");
      var token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2M2M2OTM4MjJkYjJhNzUyNjVlZjZkZjUiLCJlbWFpbCI6InN1cGVyLWFkbWluMEBnbWFpbC5jb20iLCJpYXQiOjE2NzU1OTkwMzQsImV4cCI6MTY3NTg1ODIzNH0.GQLHIukz9ng4OZg9hpoRfYPZNtIc2h-BgWr1FdNwS1o";
      var response =
          await http.get(url, headers: {"Authorization": "bearer $token"});

      var data_tmp = json.decode(response.body) as Map;
      if (data_tmp.containsKey('code')) {
        var data = json.decode(response.body);
        _currentUser = User.fromJson(data);
        userCheckedStorage.setItem("user", json.encode(_currentUser));
        print("Welcome");
        print(_currentUser!.firstname);

        return "checked";
      }

      return "not checked";
    } catch (e) {
      print(e);
      return "failed";
    }
  }
}
