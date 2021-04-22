import 'dart:convert';

import 'package:DevQuiz/shared/model/quiz_model.dart';
import 'package:flutter/services.dart';

class QuizRepository {
  Future<List<QuizModel>> getQuiz() async {
    final response = await rootBundle.loadString("database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
