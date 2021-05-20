import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/question/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final String title;
  const QuestionsWidget({Key? key, this.title = "QuestionsWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionModel question = QuestionModel(title: "Teste", answers: <AnswerModel>[
      AnswerModel(title: "Resposta 1", isRight: false),
      AnswerModel(title: "Resposta 2", isRight: false),
      AnswerModel(title: "Resposta 3", isRight: true),
      AnswerModel(title: "Resposta 4", isRight: false),
    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Questões", style: AppTextStyle.titleQuiz),
        SizedBox(height: 10),
        Container(
          height: 330,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 1)),
          ),
          child: Scrollbar(
            isAlwaysShown: true,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, i) => QuestionWidget(question: question, onPressed: () {}, isDeleteButton: true),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
