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
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nome do Quiz",
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Questões", style: AppTextStyle.titleQuiz),
                        SizedBox(height: 10),
                        Container(
                          height: 330,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 1)),
                          ),
                          child: Scrollbar(
                            isAlwaysShown: true,
                            child: ListView.builder(
                              itemCount: 50,
                              itemBuilder: (_, i) => Text("Teste"),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Selecione o Level do Quiz", style: AppTextStyle.titleQuiz),
                        SizedBox(height: 10),
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
