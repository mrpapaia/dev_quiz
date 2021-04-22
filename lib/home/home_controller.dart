import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/model/awnser_model.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:DevQuiz/shared/model/quiz_model.dart';
import 'package:DevQuiz/shared/model/user_model.dart';
import 'package:DevQuiz/shared/repository/quiz_repository.dart';
import 'package:DevQuiz/shared/repository/user_repository.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  UserModel? user;
  List<QuizModel>? quizzes;
  set state(HomeState state) => stateNotifier.value = state;
  final userRepository = UserRepository();
  final quizRepository = QuizRepository();
  HomeState get state => stateNotifier.value;
  void getUser() async {
    state = HomeState.loading;
    user = await userRepository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await quizRepository.getQuiz();

    state = HomeState.success;
  }
}
