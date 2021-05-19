import 'package:devquiz_web/app/modules/add_quiz/add_quiz_cubit.dart';
import 'package:devquiz_web/app/modules/add_quiz/add_quiz_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddQuizModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddQuizCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AddQuizPage()),
  ];
}
