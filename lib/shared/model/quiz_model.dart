import 'dart:convert';

import 'package:DevQuiz/shared/model/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringEx on String {
  Level get lvlParse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}

extension LevelEx on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito"
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final String image;
  final Level level;

  QuizModel(
      {this.questionAwnsered = 0,
      required this.image,
      required this.level,
      required this.title,
      required this.questions});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAwnsered': questionAwnsered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAwnsered: map['questionAwnsered'],
      image: map['image'],
      level: map['leve'].toString().lvlParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
