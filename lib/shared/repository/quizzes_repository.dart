import 'dart:io';

import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:dio/dio.dart';

class QuizzesRepository {
  Dio dio = Dio();
  String _baseUrl = "http://localhost:5000/api/quiz";

  Future<List<QuizModel>> getQuizzes() async {
    try {
      var response = await dio.get(_baseUrl, options: Options(responseType: ResponseType.json));
      List list = response.data;
      List<QuizModel> listQuiz = list.map((e) => QuizModel.fromMap(e)).toList();
      return listQuiz;
    } catch (e) {
      return <QuizModel>[];
    }
  }

  Future<void> deleteQuiz({required idQuiz}) async {
    try {
      var formData = FormData.fromMap({
        "idQuiz": idQuiz,
      });
      await dio.delete(_baseUrl, data: formData);
    } catch (e) {}
  }

  Future<void> postQuiz({required QuizModel quiz}) async {
    await dio.post(
      _baseUrl,
      data: quiz.toJson(),
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    );
  }
}
