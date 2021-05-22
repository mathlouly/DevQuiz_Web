import 'package:devquiz_web/core/color.dart';
import 'package:flutter/material.dart';

typedef getAnswer = Function(bool);

class SelectAnswerWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCorrect;
  final getAnswer answer;
  const SelectAnswerWidget({Key? key, required this.isSelected, required this.onTap, this.isCorrect = false, required this.answer}) : super(key: key);

  SelectAnswerWidget.correct({required this.isSelected, required this.onTap, this.isCorrect = true, required this.answer});

  SelectAnswerWidget.wrong({required this.isSelected, required this.onTap, this.isCorrect = false, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          child: InkWell(
            onTap: () {
              onTap();
              answer(isCorrect);
            },
            child: Container(
              height: 35,
              width: 35,
              color: isSelected
                  ? isCorrect
                      ? AppColors.lightGreen
                      : AppColors.lightRed
                  : AppColors.grey,
              child: Icon(
                isCorrect ? Icons.done : Icons.close,
                size: 35,
                color: isSelected
                    ? isCorrect
                        ? AppColors.green
                        : AppColors.red
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
