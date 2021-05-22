import 'package:devquiz_web/app/modules/add_quiz/widgets/add_question/answer_field/answer_field_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class AddQuestionWidget extends StatelessWidget {
  final String title;
  const AddQuestionWidget({Key? key, this.title = "AddQuestionWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Adicionar nova questão", style: AppTextStyle.titleQuiz),
          SizedBox(height: 10),
          TextFormField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Digite a questão.",
              hintStyle: AppTextStyle.textFormFieldOpacity,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text("Respostas", style: AppTextStyle.titleQuiz),
          SizedBox(height: 10),
          AnswerFieldWidget(),
          AnswerFieldWidget(),
          AnswerFieldWidget(),
          AnswerFieldWidget(),
          SizedBox(height: 10),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.blue),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            onPressed: () {},
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  "Adicionar Questão",
                  style: AppTextStyle.titleAddModule,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
