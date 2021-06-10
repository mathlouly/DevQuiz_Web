import 'package:devquiz_web/app/modules/add_quiz/add_quiz_controller.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/add_question/add_question_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/button_end/button_end_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/input_name_quiz/input_name_quiz_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/questions/questions_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/select_icon_quiz/select_icon_quiz_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/select_level_quiz/select_level_quiz_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddQuizPage extends StatefulWidget {
  final String title;
  const AddQuizPage({Key? key, this.title = 'AddQuizPage'}) : super(key: key);
  @override
  AddQuizPageState createState() => AddQuizPageState();
}

class AddQuizPageState extends State<AddQuizPage> {
  AddQuizController _addQuizController = AddQuizController();
  late QuizModel quiz;

  @override
  void initState() {
    super.initState();
    quiz = _addQuizController.quizNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "Novo Quiz",
        textStyleTitle: AppTextStyle.titlePage,
        isLogo: false,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: ValueListenableBuilder(
            valueListenable: _addQuizController.quizNotifier,
            builder: (context, value, child) {
              return Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              InputNameQuizWidget(nameQuizFun: getNameQuiz),
                              SizedBox(height: 15),
                              QuestionsWidget(addQuizController: _addQuizController),
                              SizedBox(height: 15),
                              SelectLevelQuizWidget(levelQuiz: getLevelQuiz),
                              SizedBox(height: 15),
                              SelectIconQuizWidget(iconName: getIconQuiz),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: AddQuestionWidget(addQuizController: _addQuizController),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonEndWidget.cancel(onPressed: () => Modular.to.pushNamed("/")),
                      ButtonEndWidget.add(onPressed: () {}),
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }

  void getNameQuiz(String nameQuiz) => this.quiz.title = nameQuiz;
  void getListQuestions(List<QuestionModel> questions) => this.quiz.questions = questions;
  void getLevelQuiz(String levelQuiz) => this.quiz.level = levelQuiz;
  void getIconQuiz(String iconQuiz) => this.quiz.imagem = iconQuiz;
}
