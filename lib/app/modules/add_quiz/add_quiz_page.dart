import 'package:devquiz_web/app/modules/add_quiz/widgets/add_question/add_question_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/input_name_quiz/input_name_quiz_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/questions/questions_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/select_icon_quiz/select_icon_quiz_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/select_level_quiz/select_level_quiz_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddQuizPage extends StatefulWidget {
  final String title;
  const AddQuizPage({Key? key, this.title = 'AddQuizPage'}) : super(key: key);
  @override
  AddQuizPageState createState() => AddQuizPageState();
}

class AddQuizPageState extends State<AddQuizPage> {
  QuestionModel question = QuestionModel(title: "Teste", answers: <AnswerModel>[
    AnswerModel(title: "Resposta 1", isRight: false),
    AnswerModel(title: "Resposta 2", isRight: false),
    AnswerModel(title: "Resposta 3", isRight: true),
    AnswerModel(title: "Resposta 4", isRight: false),
  ]);
  String? nameQuiz;
  List<QuestionModel> questions = [];
  String? levelQuiz;
  String? iconQuiz;

  @override
  void initState() {
    super.initState();
    questions.add(question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(levelQuiz);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "Novo Quiz",
        textStyleTitle: AppTextStyle.titlePage,
        isLogo: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputNameQuizWidget(callback: getNameQuiz),
                        SizedBox(height: 15),
                        QuestionsWidget(questions: questions, onPressed: removeQuestion),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddQuestionWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getNameQuiz(String nameQuiz) => this.nameQuiz = nameQuiz;
  void getQuestions(List<QuestionModel> questions) => this.questions = questions;
  void getLevelQuiz(String levelQuiz) => this.levelQuiz = levelQuiz;
  void getIconQuiz(String iconQuiz) => this.iconQuiz = iconQuiz;

  void removeQuestion(QuestionModel question) {
    setState(() {
      this.questions.removeWhere((element) => element == question);
    });
  }
}
