import 'package:bloc/bloc.dart';
import 'package:devquiz_web/app/modules/quizzes/repository/quizzes_repository.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';

class QuizzesCubit extends Cubit<List<QuizModel>> {
  QuizzesCubit() : super([]) {
    getQuizzes();
  }

  final QuizzesRepository _questionsRepository = QuizzesRepository();

  List<QuizModel> listQuizModel = [];

  set insertListInList(List<QuizModel> list) => this.listQuizModel = list;

  void getQuizzes() async {
    insertListInList = await _questionsRepository.getQuizzes();
    emit(listQuizModel);
  }

  void deleteQuiz({required String idQuiz}) async {
    await _questionsRepository.deleteQuiz(idQuiz: idQuiz);
    getQuizzes();
  }
}
