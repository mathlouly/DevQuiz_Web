import 'package:devquiz_web/app/modules/add_quiz/add_quiz_controller.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddQuestionWidget extends StatefulWidget {
  final AddQuizController addQuizController;
  AddQuestionWidget({Key? key, required this.addQuizController}) : super(key: key);

  @override
  _AddQuestionWidgetState createState() => _AddQuestionWidgetState();
}

class _AddQuestionWidgetState extends State<AddQuestionWidget> {
  TextEditingController textController = TextEditingController();
  List<TextEditingController> controllersAnswer = List<TextEditingController>.generate(4, (index) => TextEditingController());
  List<List<bool>> listIsSelected = List.generate(4, (index) => <bool>[false, false]);
  List<bool> listAnswer = List.generate(4, (index) => false);
  bool enabledButton = false;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollListView = ScrollController();

    checkButton() {
      List check = List.generate(4, (index) => false);

      for (var i = 0; i < 4; i++) {
        if (controllersAnswer[i].text.isNotEmpty && listIsSelected[i].contains(true)) {
          check[i] = true;
        } else {
          check[i] = false;
        }
      }

      if (!check.contains(false) && textController.text.isNotEmpty) {
        setState(() => enabledButton = true);
      } else {
        setState(() => enabledButton = false);
      }
    }

    clearAll() {
      textController.clear();
      controllersAnswer.forEach((element) => element.clear());
      listIsSelected.forEach((element) {
        element[0] = false;
        element[1] = false;
      });
      checkButton();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Adicionar nova questão", style: AppTextStyle.titleQuiz),
        SizedBox(height: 10),
        TextFormField(
          controller: textController,
          onChanged: (_) => checkButton(),
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Digite a questão.",
            hintStyle: AppTextStyle.textFormFieldOpacity,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text("Respostas", style: AppTextStyle.titleQuiz),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          controller: scrollListView,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        onChanged: (title) => checkButton(),
                        controller: controllersAnswer[index],
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
                  ToggleButtons(
                    color: Colors.grey,
                    borderColor: Colors.grey[600],
                    selectedBorderColor: Colors.grey[600],
                    constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: listIsSelected[index][0] ? AppColors.lightGreen : AppColors.grey,
                        child: Icon(Icons.done, size: 35, color: listIsSelected[index][0] ? AppColors.green : null),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: listIsSelected[index][1] ? AppColors.lightRed : AppColors.grey,
                        child: Icon(Icons.close, size: 35, color: listIsSelected[index][1] ? AppColors.red : null),
                      ),
                    ],
                    isSelected: listIsSelected[index],
                    onPressed: (value) {
                      for (var i = 0; i < listIsSelected[index].length; i++) {
                        if (listIsSelected[index][i] == true) {
                          listIsSelected[index][i] = false;
                        }
                      }
                      listIsSelected[index][value] = !listIsSelected[index][value];
                      listAnswer[index] = listIsSelected[index][0];
                      checkButton();
                    },
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 10),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(enabledButton ? AppColors.blue : Colors.grey),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          onPressed: enabledButton
              ? () {
                  widget.addQuizController.addQuestion(
                    QuestionModel(
                      title: textController.text,
                      answers: List.generate(4, (index) => AnswerModel(title: controllersAnswer[index].text, isRight: listAnswer[index])),
                    ),
                  );
                  clearAll();
                  widget.addQuizController.quizNotifier.notifyListeners();
                }
              : null,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Text(
                "Adicionar Questão",
                style: AppTextStyle.titleAddModule,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
