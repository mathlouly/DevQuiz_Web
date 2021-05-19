import 'package:devquiz_web/app/modules/quizzes/cubit/quizzes_cubit.dart';
import 'package:devquiz_web/app/modules/quizzes/widgets/quiz_tile/quiz_tile_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);
  @override
  QuizzesPageState createState() => QuizzesPageState();
}

class QuizzesPageState extends State<QuizzesPage> {
  final QuizzesCubit _quizzesCubit = Modular.get();

  @override
  @override
  void dispose() {
    _quizzesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Quizzes",
        textStyleTitle: AppTextStyle.titlePage,
        isLogo: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.linearWithOpacity,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: BlocBuilder<QuizzesCubit, List<QuizModel>>(
                bloc: _quizzesCubit,
                builder: (context, listQuizModel) => ListView.builder(
                  itemCount: listQuizModel.length,
                  itemBuilder: (context, i) => QuizTileWidget(quiz: listQuizModel.reversed.toList()[i], quizzesCubit: _quizzesCubit),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 60, bottom: 60),
        child: FloatingActionButton(
          backgroundColor: AppColors.green,
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
