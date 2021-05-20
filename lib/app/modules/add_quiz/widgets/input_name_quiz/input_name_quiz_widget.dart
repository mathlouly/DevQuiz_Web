import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class InputNameQuizWidget extends StatelessWidget {
  const InputNameQuizWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
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
