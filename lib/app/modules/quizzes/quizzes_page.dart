import 'package:devquiz_web/app/modules/quizzes/quizzes_controller.dart';
import 'package:devquiz_web/app/modules/quizzes/widgets/quiz_tile/quiz_tile_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);
  @override
  QuizzesPageState createState() => QuizzesPageState();
}

class QuizzesPageState extends State<QuizzesPage> {
  QuizzesController quizzesController = QuizzesController();

  @override
  void initState() {
    super.initState();
    quizzesController.getQuizzes();
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
              child: ValueListenableBuilder<List<QuizModel>>(
                valueListenable: quizzesController.listQuizzes,
                builder: (context, quizzes, child) {
                  return quizzes.isEmpty
                      ? ValueListenableBuilder<bool>(
                          valueListenable: quizzesController.emptyList,
                          builder: (context, value, child) {
                            return value
                                ? Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Não encontrei o que você espera encontrar :(",
                                        style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.close, color: Colors.red, size: 120),
                                    ],
                                  ))
                                : Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: AppColors.purple,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                                    ),
                                  );
                          })
                      : ListView.builder(
                          itemCount: quizzes.length,
                          itemBuilder: (context, i) => QuizTileWidget(quiz: quizzes.reversed.toList()[i], quizzesController: quizzesController),
                        );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 60, bottom: 60),
        child: FloatingActionButton(
          backgroundColor: AppColors.green,
          onPressed: () => Modular.to.pushNamed("/addquiz"),
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
