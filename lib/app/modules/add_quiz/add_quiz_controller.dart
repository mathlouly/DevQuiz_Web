import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/repository/quizzes_repository.dart';
import 'package:flutter/cupertino.dart';

class AddQuizController {
  final QuizzesRepository _repository = QuizzesRepository();

  late ValueNotifier<QuizModel> quizNotifier;

  AddQuizController() {
    this.quizNotifier = ValueNotifier<QuizModel>(QuizModel(questions: []));
  }

  addQuestion(QuestionModel question) {
    quizNotifier.value.questions.add(question);
  }

  removeQuestion(QuestionModel question) => this.quizNotifier.value.questions.removeWhere((element) => element == question);

  List<QuestionModel> get listQuestion => quizNotifier.value.questions;

  void postQuiz({required QuizModel quiz}) async {
    await _repository.postQuiz(quiz: quiz).then((value) {
      print(value);
    });
  }
}
