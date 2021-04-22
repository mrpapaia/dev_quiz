import 'dart:convert';

class UserModel {
  final String name;
  final String fotoUrl;
  final int score;
  UserModel({
    required this.name,
    required this.fotoUrl,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fotoUrl': fotoUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      fotoUrl: map['fotoUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
