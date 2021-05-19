import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class ButtonQuizTileWidget extends StatelessWidget {
  final IconData? iconData;
  final Color? colorButton;
  final double? heightButton;
  final VoidCallback voidCallback;

  ButtonQuizTileWidget({
    Key? key,
    this.iconData,
    this.colorButton,
    this.heightButton,
    required this.voidCallback,
  });

  ButtonQuizTileWidget.edit({required double? heightButton, required VoidCallback voidCallback})
      : this.iconData = Icons.edit,
        this.colorButton = AppColors.blue,
        this.heightButton = heightButton,
        this.voidCallback = voidCallback;

  ButtonQuizTileWidget.delete({required double? heightButton, required VoidCallback voidCallback})
      : this.iconData = Icons.delete,
        this.colorButton = AppColors.red,
        this.heightButton = heightButton,
        this.voidCallback = voidCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: heightButton ?? 50,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
        ),
        child: Icon(
          iconData,
          color: colorButton,
          size: 25,
        ),
        onPressed: voidCallback,
      ),
    );
  }
}