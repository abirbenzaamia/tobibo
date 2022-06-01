import 'dart:ffi';

class MedecinModel {
  final int id;
  final String nom;
  final String prenom;
  final String email;
  final String num_tel;

  MedecinModel(this.id, this.nom, this.prenom, this.email, this.num_tel);

  MedecinModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['nom'],
        prenom = json['prenom'],
        email = json['email'],
        num_tel = json['num_tel'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'num_tel': num_tel,
      };
}
