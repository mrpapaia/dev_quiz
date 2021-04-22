import 'package:DevQuiz/shared/model/user_model.dart';
import 'package:flutter/services.dart';

class UserRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("database/user.json");
    return UserModel.fromJson(response);
  }
}
