import 'package:devquiz_web/app/modules/add_quiz/add_quiz_controller.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final AddQuizController addQuizController;
  LevelButtonWidget({Key? key, required this.isSelected, required this.label, required this.onPressed, required this.addQuizController})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(key: key);

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },
  };

  Color get color => isSelected ? config[label]!['color']! : AppColors.levelButtonNotSelected;
  Color get borderColor => isSelected ? config[label]!['borderColor']! : AppColors.levelButtonBorderNotSelected;
  Color get fontColor => isSelected ? config[label]!['fontColor']! : AppColors.levelButtonTextNotSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: TextButton(
        onPressed: () {
          onPressed();
          addQuizController.levelQuiz(label);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              side: BorderSide(color: borderColor, width: 1),
            ),
          ),
        ),
        child: Container(
          width: 80,
          height: 32,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.notoSans(fontSize: 13, color: fontColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
