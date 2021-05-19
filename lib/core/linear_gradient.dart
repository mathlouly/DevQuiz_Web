//57B6E5 - Azul
//8257E6 - Roxo

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff57B6E5),
      Color(0xff8257E6),
    ],
  );
  static final linearWithOpacity = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff57B6E5).withOpacity(0.80),
      Color(0xff8257E6).withOpacity(0.80),
    ],
  );
}
