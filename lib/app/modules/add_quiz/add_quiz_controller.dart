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
    quizNotifier.value = quizNotifier.value.copyWith(questions: quizNotifier.value.questions);
  }

  titleQuiz(String title) => quizNotifier.value.title = title;

  levelQuiz(String level) => quizNotifier.value.level = level;

  iconQuiz(String icon) => quizNotifier.value.imagem = icon;

  removeQuestion(QuestionModel question) {
    quizNotifier.value.questions.removeWhere((element) => element == question);
    quizNotifier.value = quizNotifier.value.copyWith(questions: quizNotifier.value.questions);
  }

  List<QuestionModel> get listQuestion => quizNotifier.value.questions;

  Future<void> postQuiz() async {
    await _repository.postQuiz(quiz: quizNotifier.value);
  }
}
