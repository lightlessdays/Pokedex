import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

import 'fonts.dart';

class Themings {
  static const TextStyle darkText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
  );

  static const TextStyle lightText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
  );


  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: lightText,
    ),
    textTheme: const TextTheme(
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelSmall: lightText,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: AppColors.whiteGrey),
  );
}
