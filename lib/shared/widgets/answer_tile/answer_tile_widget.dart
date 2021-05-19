import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class AnswerTileWidget extends StatelessWidget {
  final String answer;
  final bool isRight;
  const AnswerTileWidget({Key? key, required this.answer, required this.isRight}) : super(key: key);

  Color get backColor => isRight ? AppColors.lightGreen : AppColors.lightRed;
  TextStyle get font => isRight ? AppTextStyle.titleAnswerRight : AppTextStyle.titleAnswerWrong;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
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
