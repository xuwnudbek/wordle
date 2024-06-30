import 'package:flutter/material.dart';
import 'package:wordle/utils/rgb.dart';

class ThemeData2 {
  static ThemeData get getThemeData {
    return ThemeData(
      fontFamily: "JungleRegular", //OldFont = RebellionSquad
      primaryColor: RGB.saddleBrown,
      //AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: RGB.saddleBrown,
        foregroundColor: RGB.wheat,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: "JungleRegular", // OldFont = RebellionSquad
          fontSize: 24.0,
          color: RGB.wheat,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
