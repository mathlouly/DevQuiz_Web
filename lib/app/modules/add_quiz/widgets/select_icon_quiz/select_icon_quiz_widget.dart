import 'package:devquiz_web/app/modules/add_quiz/widgets/select_icon_quiz/select_icon/select_icon_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class SelectIconQuizWidget extends StatefulWidget {
  final getIconName iconName;
  const SelectIconQuizWidget({Key? key, required this.iconName}) : super(key: key);

  @override
  _SelectIconQuizWidgetState createState() => _SelectIconQuizWidgetState();
}

class _SelectIconQuizWidgetState extends State<SelectIconQuizWidget> {
  List<bool> isSelected = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selecione o Icone do Quiz", style: AppTextStyle.titleQuiz),
        SizedBox(height: 10),
        Row(
          children: [
            SelectIconWidget(image: AppImages.data, isSelect: isSelected[0], onTap: () => selectIcon(0), iconName: widget.iconName),
            SelectIconWidget(image: AppImages.laptop, isSelect: isSelected[1], onTap: () => selectIcon(1), iconName: widget.iconName),
            SelectIconWidget(image: AppImages.hierarchy, isSelect: isSelected[2], onTap: () => selectIcon(2), iconName: widget.iconName),
            SelectIconWidget(image: AppImages.blocks, isSelect: isSelected[3], onTap: () => selectIcon(3), iconName: widget.iconName),
          ],
        )
      ],
    );
  }

  void selectIcon(index) {
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
