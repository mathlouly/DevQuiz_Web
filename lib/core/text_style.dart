import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final titlePage = GoogleFonts.notoSans(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  static final titleQuiz = GoogleFonts.notoSans(fontSize: 18, color: Colors.black);
  static final titleQuestion = GoogleFonts.notoSans(fontSize: 16, color: Colors.black);
  static final titleAnswerWrong = GoogleFonts.notoSans(fontSize: 14, color: AppColors.red);
  static final titleAnswerRight = GoogleFonts.notoSans(fontSize: 14, color: AppColors.green);
  static final titleAddModule = GoogleFonts.notoSans(fontSize: 20, color: Colors.white);
  static final textFormField = GoogleFonts.notoSans(fontSize: 16, color: Colors.black);
  static final textFormFieldOpacity = GoogleFonts.notoSans(fontSize: 16, color: Colors.black.withOpacity(0.4));
  static final buttonTextCancelar = GoogleFonts.notoSans(fontSize: 20, color: AppColors.cancelTextColor);
  static final buttonTextProximo = GoogleFonts.notoSans(fontSize: 20, color: Colors.white);
}
