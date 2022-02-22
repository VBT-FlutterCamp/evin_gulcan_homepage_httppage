import 'package:flutter/material.dart';

class StyleText {
  FontWeight styleFontWeight = FontWeight.w700;

  var subTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xfffafafa),
    fontWeight: FontWeight.w600,
  );

  var cleanTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xfffafafa),
    fontWeight: FontWeight.w600,
  );
  var listTileTitle = const TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontWeight: FontWeight.w600,
  );

  var listTileSubtitle = TextStyle(
      overflow: TextOverflow.ellipsis,
      foreground: Paint()
        ..shader = const LinearGradient(
          colors: <Color>[
            Colors.black,
            Colors.white,
          ],
        ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 100.0)));
}
