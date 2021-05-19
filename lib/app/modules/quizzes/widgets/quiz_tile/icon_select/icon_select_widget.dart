import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class IconSelectWidget extends StatelessWidget {
  final String iconeName;
  IconSelectWidget({required this.iconeName}) : assert(["blocks", "data", "laptop", "hierarchy"].contains(iconeName));

  final imagePath = {"blocks": AppImages.blocks, "data": AppImages.data, "laptop": AppImages.laptop, "hierarchy": AppImages.hierarchy};

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath[iconeName]!);
  }
}
