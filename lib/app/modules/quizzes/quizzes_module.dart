import 'package:devquiz_web/app/modules/quizzes/cubit/quizzes_cubit.dart';
import 'package:devquiz_web/app/modules/quizzes/repository/quizzes_repository.dart';
import 'package:devquiz_web/app/modules/quizzes/quizzes_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuizzesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => QuizzesRepository()),
    Bind.lazySingleton((i) => QuizzesCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => QuizzesPage()),
  ];
}
