import 'package:devquiz_web/app/modules/add_quiz/add_quiz_module.dart';
import 'package:devquiz_web/app/modules/quizzes/quizzes_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/", module: AddQuizModule()),
  ];
}
