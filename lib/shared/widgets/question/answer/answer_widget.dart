import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;
  final bool isRight;
  const AnswerWidget({Key? key, required this.answer, required this.isRight}) : super(key: key);

  Color get backColor => isRight ? AppColors.lightGreen : AppColors.lightRed;
  TextStyle get font => isRight ? AppTextStyle.titleAnswerRight : AppTextStyle.titleAnswerWrong;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: backColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          answer,
          style: font,
        ),
      ),
    );
  }
}
