import 'package:devquiz_web/app/modules/add_quiz/add_quiz_controller.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/widgets/question/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final AddQuizController addQuizController;
  const QuestionsWidget({Key? key, required this.addQuizController}) : super(key: key);

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
                itemCount: addQuizController.listQuestion.length,
                itemBuilder: (_, i) => QuestionWidget(question: addQuizController.listQuestion[i], onPressed: addQuizController.removeQuestion, isDeleteButton: true),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
