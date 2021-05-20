import 'package:devquiz_web/app/modules/add_quiz/widgets/input_name_quiz/input_name_quiz_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/questions/questions_widget.dart';
import 'package:devquiz_web/app/modules/add_quiz/widgets/select_level_quiz/select_level_quiz_widget.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddQuizPage extends StatefulWidget {
  final String title;
  const AddQuizPage({Key? key, this.title = 'AddQuizPage'}) : super(key: key);
  @override
  AddQuizPageState createState() => AddQuizPageState();
}

class AddQuizPageState extends State<AddQuizPage> {
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
                        InputNameQuizWidget(),
                        SizedBox(height: 15),
                        QuestionsWidget(),
                        SizedBox(height: 15),
                        SelectLevelQuizWidget(),
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
                        Container(),
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
}
