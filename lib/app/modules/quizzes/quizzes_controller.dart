import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/repository/quizzes_repository.dart';
import 'package:flutter/cupertino.dart';

class QuizzesController {
  final QuizzesRepository _repository = QuizzesRepository();

  final listQuizzes = ValueNotifier<List<QuizModel>>([]);
  final emptyList = ValueNotifier<bool>(false);

  void getQuizzes() async {
    await Future.delayed(Duration(seconds: 2));
    listQuizzes.value = await _repository.getQuizzes();
    listQuizzes.value.isEmpty ? emptyList.value = true : emptyList.value = false;
  }

  void deleteQuiz({required String idQuiz}) async {
    await _repository.deleteQuiz(idQuiz: idQuiz);
    getQuizzes();
  }
}
