import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/UserProfile.dart';
import 'package:flutter_app/value/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future<http.Response> postLoginRequest() async {
  var url = SERVER_URL_AUTH_WORKER + '/api/login';

  Map data = {'email': 'mobileteam@gmail.com', 'password': 'A1234567'};
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  Map userToken = json.decode(response.body);
  var user = User.fromJson(userToken);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(TOKEN, user.access_token);

  return response;
}

Future<http.Response> getUserProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.getString(TOKEN) ?? "";

  log('andrew up, $token');
  final http.Response response =
      await http.get(SERVER_URL_AUTH_WORKER + '/api/user', headers: {
    "Content-Type": "application/json",
    HttpHeaders.authorizationHeader: "Bearer " + token
  });

  log('andrew, ${response.body}');

  final responseJson = json.decode(response.body);
  var userProfile = UserProfile.fromJson(responseJson);
  await prefs.setInt(USER_ID, userProfile.id);

  return response;
}
