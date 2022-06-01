import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:io';

import 'package:tobibo/src/screens/login_screen.dart';

final API = "https://e26b-129-45-34-220.ngrok.io";

class SignupPost {
  SignupPost();

  factory SignupPost.fromJson(Map<String, dynamic> json) {
    return SignupPost();
  }
}

Future<int> Signup(context, nom, prenom, email, num_tel, mdp) async {
  final response = await http.post(
    Uri.parse(API + '/auth/register'),
    body: {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "num_tel": num_tel,
      "mdp": num_tel
    },
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 201) {
    print('log in with success');
    Navigator.of(context).pushNamed('login');
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    print("une erreur s'est produite");
  }
  return response.statusCode;
}
