import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/question/question_widget.dart';
import 'package:flutter/material.dart';

typedef removeQuestion = Function(QuestionModel);

class QuestionsWidget extends StatelessWidget {
  final removeQuestion onPressed;
  final List<QuestionModel> questions;
  const QuestionsWidget({Key? key, required this.onPressed, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Questões", style: AppTextStyle.titleQuiz),
        SizedBox(height: 10),
        Container(
          height: 500,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 1)),
          ),
          child: Scrollbar(
            isAlwaysShown: true,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (_, i) => QuestionWidget(question: questions[i], onPressed: onPressed, isDeleteButton: true),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
