import 'package:devquiz_web/core/color.dart';
import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonEndWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? textButton;
  final bool? isAdd;
  const ButtonEndWidget({Key? key, required this.onPressed, this.textButton, this.isAdd}) : super(key: key);

  ButtonEndWidget.add({required this.onPressed, this.textButton = "Adicionar Quiz", this.isAdd = true});

  ButtonEndWidget.cancel({required this.onPressed, this.textButton = "Cancelar", this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.grey,
        gradient: isAdd! ? AppGradients.linear : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Text(
            textButton ?? "",
            style: GoogleFonts.notoSans(fontSize: 20, color: isAdd! ? Colors.white : Colors.grey),
          ),
        ),
      ),
    );
  }
}
