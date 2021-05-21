import 'package:devquiz_web/app/modules/add_quiz/widgets/select_level_quiz/level_button/level_button_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

typedef getLevelQuiz = Function(String);

class SelectLevelQuizWidget extends StatefulWidget {
  final getLevelQuiz levelQuiz;
  const SelectLevelQuizWidget({Key? key, required this.levelQuiz}) : super(key: key);

  @override
  _SelectLevelQuizWidgetState createState() => _SelectLevelQuizWidgetState();
}

class _SelectLevelQuizWidgetState extends State<SelectLevelQuizWidget> {
  List<bool> isSelected = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selecione o Level do Quiz", style: AppTextStyle.titleQuiz),
        SizedBox(height: 10),
        Row(
          children: [
            LevelButtonWidget(label: "Fácil", isSelected: isSelected[0], onPressed: () => selectLevelButton(0), nameQuiz: widget.levelQuiz),
            LevelButtonWidget(label: "Médio", isSelected: isSelected[1], onPressed: () => selectLevelButton(1), nameQuiz: widget.levelQuiz),
            LevelButtonWidget(label: "Difícil", isSelected: isSelected[2], onPressed: () => selectLevelButton(2), nameQuiz: widget.levelQuiz),
            LevelButtonWidget(label: "Perito", isSelected: isSelected[3], onPressed: () => selectLevelButton(3), nameQuiz: widget.levelQuiz),
          ],
        ),
      ],
    );
  }

  void selectLevelButton(index) {
    for (var i = 0; i < isSelected.length; i++) {
      if (isSelected[i] == true) {
        isSelected[i] = false;
      }
    }
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }
}
