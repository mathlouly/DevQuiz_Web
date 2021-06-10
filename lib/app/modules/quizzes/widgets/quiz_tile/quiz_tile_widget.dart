import 'package:devquiz_web/app/modules/quizzes/quizzes_controller.dart';
import 'package:devquiz_web/app/modules/quizzes/widgets/quiz_tile/button_quiz_tile/button_quiz_tile_widget.dart';
import 'package:devquiz_web/app/modules/quizzes/widgets/quiz_tile/icon_select/icon_select_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/question/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class QuizTileWidget extends StatefulWidget {
  final QuizModel quiz;
  final QuizzesController quizzesController;
  const QuizTileWidget({Key? key, required this.quiz, required this.quizzesController}) : super(key: key);

  @override
  _QuizTileWidgetState createState() => _QuizTileWidgetState();
}

class _QuizTileWidgetState extends State<QuizTileWidget> {
  GlobalKey widgetKey = GlobalKey();
  double? heightExpansionTile;

  _getSizeExpansionTile() {
    setState(() {
      heightExpansionTile = widgetKey.currentContext?.size?.height;
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) => _getSizeExpansionTile());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        width: 900,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              ExpansionTile(
                key: widgetKey,
                leading: Container(
                  width: 25,
                  height: 25,
                  child: IconSelectWidget(iconeName: widget.quiz.imagem!),
                ),
                title: Text(
                  widget.quiz.title!,
                  style: AppTextStyle.titleQuiz,
                ),
                tilePadding: EdgeInsets.only(left: 10),
                trailing: Container(width: 1, height: 1),
                childrenPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                children: widget.quiz.questions.map((question) => QuestionWidget(question: question)).toList(),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                height: heightExpansionTile ?? 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonQuizTileWidget.edit(
                      voidCallback: () {},
                      heightButton: heightExpansionTile,
                    ),
                    ButtonQuizTileWidget.delete(
                      voidCallback: () {
                        widget.quizzesController.deleteQuiz(idQuiz: widget.quiz.id!);
                      },
                      heightButton: heightExpansionTile,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
