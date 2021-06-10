import 'package:devquiz_web/app/modules/add_quiz/add_quiz_controller.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class InputNameQuizWidget extends StatelessWidget {
  final AddQuizController addQuizController;
  const InputNameQuizWidget({Key? key, required this.addQuizController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: (title) => addQuizController.titleQuiz(title),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Nome do Quiz",
          hintStyle: AppTextStyle.textFormFieldOpacity,
          contentPadding: EdgeInsets.only(bottom: 5),
        ),
        style: AppTextStyle.textFormField,
      ),
    );
  }
}
