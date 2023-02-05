import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  String apiLink = "https://cnic.onrender.com";
  String code = "1673858285111";
  var url = Uri.parse("$apiLink/users/find-by-code/$code");
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2M2M2OTM4MjJkYjJhNzUyNjVlZjZkZjUiLCJlbWFpbCI6InN1cGVyLWFkbWluMEBnbWFpbC5jb20iLCJpYXQiOjE2NzU1OTkwMzQsImV4cCI6MTY3NTg1ODIzNH0.GQLHIukz9ng4OZg9hpoRfYPZNtIc2h-BgWr1FdNwS1o";
  var response =
      await http.get(url, headers: {"Authorization": "bearer $token"});
  var data = json.decode(response.body);
  print(data);
}
