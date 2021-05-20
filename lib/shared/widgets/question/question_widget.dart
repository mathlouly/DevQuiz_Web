import 'package:devquiz_web/core/color.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:devquiz_web/shared/models/quiz_model.dart';
import 'package:devquiz_web/shared/widgets/question/answer/answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel question;
  final bool isDeleteButton;
  final VoidCallback? onPressed;
  const QuestionWidget({Key? key, required this.question, this.isDeleteButton = false, this.onPressed}) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool isClick = false;
  bool endAnimation = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: MouseRegion(
        opaque: true,
        child: InkWell(
          overlayColor: MaterialStateProperty.all(Colors.white),
          onTap: () {
            setState(() {
              isClick = !isClick;
            });
          },
          child: AnimatedContainer(
            color: AppColors.grey,
            duration: Duration(milliseconds: 50),
            curve: Curves.easeInExpo,
            height: isClick ? 210 : 35,
            onEnd: () {
              setState(() {
                endAnimation = !endAnimation;
              });
            },
            child: isClick
                ? endAnimation
                    ? questionExpand(true)
                    : questionCollapse(true)
                : questionCollapse(true),
          ),
        ),
      ),
    );
  }

  Widget questionCollapse(bool isPadding) {
    return Padding(
      padding: isPadding ? EdgeInsets.symmetric(horizontal: 10, vertical: 4) : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.question.title, style: AppTextStyle.titleQuestion),
          widget.isDeleteButton
              ? TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all(Size(10, 10)),
                  ),
                  onPressed: widget.onPressed ?? () {},
                  child: Icon(
                    Icons.delete,
                    color: AppColors.red,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget questionExpand(bool isPadding) {
    List<Widget>? list = <Widget>[];
    list.add(questionCollapse(false));
    list.add(SizedBox(height: 20));
    for (var i = 0; i < widget.question.answers.length; i++) {
      list.add(AnswerWidget(answer: widget.question.answers[i].title, isRight: widget.question.answers[i].isRight));
    }
    return Padding(
      padding: isPadding ? EdgeInsets.symmetric(horizontal: 10, vertical: 4) : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: list,
      ),
    );
  }
}
