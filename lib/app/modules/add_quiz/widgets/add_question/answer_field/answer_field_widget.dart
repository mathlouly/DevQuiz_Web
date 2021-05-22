import 'package:devquiz_web/app/modules/add_quiz/widgets/add_question/answer_field/select_answer/select_answer_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class AnswerFieldWidget extends StatefulWidget {
  const AnswerFieldWidget({Key? key}) : super(key: key);
  @override
  _AnswerFieldWidgetState createState() => _AnswerFieldWidgetState();
}

class _AnswerFieldWidgetState extends State<AnswerFieldWidget> {
  List<bool> isSelected = [false, false];
  bool? isRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Digite a questão.",
                  hintStyle: AppTextStyle.textFormFieldOpacity,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SelectAnswerWidget.correct(isSelected: isSelected[0], onTap: () => selectAnswer(0), answer: getAnswer),
          SizedBox(width: 10),
          SelectAnswerWidget.wrong(isSelected: isSelected[1], onTap: () => selectAnswer(1), answer: getAnswer),
        ],
      ),
    );
  }

  void selectAnswer(index) {
    for (var i = 0; i < isSelected.length; i++) {
      if (isSelected[i] == true) {
        isSelected[i] = false;
      }
    }
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  void getAnswer(bool isRight) => this.isRight = isRight;
}
