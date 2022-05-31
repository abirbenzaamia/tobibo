import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:io';

final API = "https://7cc0-129-45-34-220.ngrok.io";

class LogPost {
  LogPost();

  factory LogPost.fromJson(Map<String, dynamic> json) {
    return LogPost();
  }
}

Future<int> Login(email, mdp) async {
  final response = await http.post(
    Uri.parse(API + '/auth/login'),
    body: {"email": email, "mdp": mdp},
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 201) {
    print('log in with success');
  } else {
    print(email);
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    print("errrrrooooor");
  }
  return response.statusCode;
}
