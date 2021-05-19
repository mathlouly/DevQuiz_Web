import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:dio/dio.dart';

class QuizzesRepository {
  Dio dio = Dio();
  String _baseUrl = "http://localhost:5000/api/quiz";

  Future<List<QuizModel>> getQuizzes() async {
    var response = await dio.get(_baseUrl, options: Options(responseType: ResponseType.json));
    List list = response.data;
    List<QuizModel> listQuiz = list.map((e) => QuizModel.fromMap(e)).toList();
    return listQuiz;
  }

  Future<void> deleteQuiz({required idQuiz}) async {
    try {
      var formData = FormData.fromMap({
        "idQuiz": idQuiz,
      });
      var response = await dio.delete(_baseUrl, data: formData);
      print(response.data);
    } catch (e) {}
  }
}
