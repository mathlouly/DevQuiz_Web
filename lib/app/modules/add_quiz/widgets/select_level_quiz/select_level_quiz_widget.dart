import 'package:devquiz_web/app/modules/add_quiz/add_quiz_controller.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/select_level_quiz/level_button/level_button_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class SelectLevelQuizWidget extends StatefulWidget {
  final AddQuizController addQuizController;
  const SelectLevelQuizWidget({Key? key, required this.addQuizController}) : super(key: key);

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
            LevelButtonWidget(label: "Fácil", isSelected: isSelected[0], onPressed: () => selectLevelButton(0), addQuizController: widget.addQuizController),
            LevelButtonWidget(label: "Médio", isSelected: isSelected[1], onPressed: () => selectLevelButton(1), addQuizController: widget.addQuizController),
            LevelButtonWidget(label: "Difícil", isSelected: isSelected[2], onPressed: () => selectLevelButton(2), addQuizController: widget.addQuizController),
            LevelButtonWidget(label: "Perito", isSelected: isSelected[3], onPressed: () => selectLevelButton(3), addQuizController: widget.addQuizController),
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
