import 'package:devquiz_web/app/modules/add_quiz/add_quiz_page.dart';
import 'package:devquiz_web/app/modules/quizzes/quizzes_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, __) => QuizzesPage(), transition: TransitionType.downToUp),
    ChildRoute("/addquiz", child: (_, __) => AddQuizPage(), transition: TransitionType.upToDown),
  ];
}
