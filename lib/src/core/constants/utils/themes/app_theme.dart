import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';

class AppThemeData{
 static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorTheme.blue,
      primary: ColorTheme.blue,
      onSurface: ColorTheme.grey,
    ),
  );
}
