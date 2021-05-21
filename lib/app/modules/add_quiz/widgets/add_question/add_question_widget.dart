import 'package:flutter/material.dart';

class AddQuestionWidget extends StatelessWidget {
  final String title;
  const AddQuestionWidget({Key? key, this.title = "AddQuestionWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}