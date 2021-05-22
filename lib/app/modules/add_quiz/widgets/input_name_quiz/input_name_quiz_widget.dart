import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

typedef GetNameQuiz = Function(String);

class InputNameQuizWidget extends StatelessWidget {
  final GetNameQuiz nameQuizFun;
  const InputNameQuizWidget({Key? key, required this.nameQuizFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: (text) => nameQuizFun(text),
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
