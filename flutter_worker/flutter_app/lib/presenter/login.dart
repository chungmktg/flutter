import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../const.dart';

  String url = SERVER_URL_AUTH_WORKER+'/api/login';
  Map map = {
    'email': 'mobileteam@gmail.com',
    'password': 'A1234567'
  };

Future<String> apiLoginRequest(String url, Map jsonMap) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(jsonMap)));
  HttpClientResponse response = await request.close();
  // todo - you should check the response.statusCode
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  return reply;
}

Future<http.Response> postLoginRequest () async {
  var url = SERVER_URL_AUTH_WORKER+'/api/login';

  Map data = {
    'email': 'mobileteam@gmail.com',
    'password': 'A1234567'
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
