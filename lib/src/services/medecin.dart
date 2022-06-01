import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:io';

import 'package:tobibo/src/models/MedecinModel.dart';

final API = "https://5ff9-129-45-34-220.ngrok.io";

Future<List<MedecinModel>> fetchData() async {
  final response = await http.get(
    Uri.parse(API + '/medecin'),
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new MedecinModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<Map<MedecinModel, dynamic>> GetMedeins() async {
  final response = await http.get(
    Uri.parse(API + '/medecin'),
  );

  print(response.statusCode);
  print(response.body);
  Map<MedecinModel, dynamic> medecins = <MedecinModel, dynamic>{};
  if (response.statusCode == 200) {
    //medecins = json.decode(response.body);
    print("une erreur s'est produite");
    print(medecins);
    return medecins;
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    print("une erreur s'est produite");
    return medecins;
  }
}
