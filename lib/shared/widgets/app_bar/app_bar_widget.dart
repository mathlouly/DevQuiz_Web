import 'package:devquiz_web/core/core.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({required String title, required TextStyle textStyleTitle, required bool isLogo})
      : super(
          preferredSize: Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Center(child: Text(title, style: textStyleTitle)),
                    ),
                    isLogo
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.logo),
                              SizedBox(width: 30),
                              Container(width: 2, height: 35, color: Colors.white),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        );
}
