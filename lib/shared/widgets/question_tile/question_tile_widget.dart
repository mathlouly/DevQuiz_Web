import 'package:devquiz_web/app/modules/quizzes/widgets/quiz_tile/button_quiz_tile/button_quiz_tile_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/answer_tile/answer_tile_widget.dart';
import 'package:flutter/material.dart';

class QuestionTileWidget extends StatefulWidget {
  final QuestionModel question;
  final bool isNewModule;
  const QuestionTileWidget({
    Key? key,
    required this.question,
    this.isNewModule = false,
  }) : super(key: key);

  QuestionTileWidget.newModule({required this.question, this.isNewModule = true});

  @override
  _QuestionTileWidgetState createState() => _QuestionTileWidgetState();
}

class _QuestionTileWidgetState extends State<QuestionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        width: 800,
        child: Card(
          child: widget.isNewModule
              ? Stack(
                  children: [
                    ExpansionTile(
                      trailing: Container(
                        width: 0,
                      ),
                      backgroundColor: Colors.grey[100],
                      collapsedBackgroundColor: Colors.grey[100],
                      title: Text(
                        widget.question.title,
                        style: AppTextStyle.titleQuestion,
                      ),
                      children: widget.question.answers.map((AnswerModel answer) => AnswerTileWidget(answer: answer.title, isRight: answer.isRight)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonQuizTileWidget.delete(heightButton: 50, voidCallback: () {}),
                      ],
                    ),
                  ],
                )
              : ExpansionTile(
                  backgroundColor: Colors.grey[100],
                  collapsedBackgroundColor: Colors.grey[100],
                  title: Text(
                    widget.question.title,
                    style: AppTextStyle.titleQuestion,
                  ),
                  children: widget.question.answers.map((AnswerModel answer) => AnswerTileWidget(answer: answer.title, isRight: answer.isRight)).toList(),
                ),
        ),
      ),
    );
  }
}
