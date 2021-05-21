import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

typedef getIconName = Function(String);

class SelectIconWidget extends StatelessWidget {
  final String image;
  final bool isSelect;
  final VoidCallback onTap;
  final getIconName iconName;
  const SelectIconWidget({Key? key, required this.image, required this.isSelect, required this.onTap, required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: MouseRegion(
        child: InkWell(
          onTap: () {
            onTap();
            iconName(image);
          },
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(width: 1.2, color: Colors.black)),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(width: 1, color: Colors.black)),
                      shape: BoxShape.circle,
                      color: isSelect ? AppColors.green : Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
