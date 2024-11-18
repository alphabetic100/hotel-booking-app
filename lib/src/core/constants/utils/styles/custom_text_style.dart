import 'package:flutter/material.dart';

import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';

class CustomStyle {
  static TextStyle titleStyle = const TextStyle(
    color: ColorTheme.blue,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static TextStyle regularStyle = const TextStyle(
    color: ColorTheme.grey,
    fontFamily: openSans,
    fontSize: 18,
  );
  static TextStyle yellowStyle = const TextStyle(
    color: ColorTheme.yellow,
    fontFamily: openSans,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle textFieldTitle = const TextStyle(
    color: ColorTheme.grey,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle blackTitleText = const TextStyle(
    color: ColorTheme.black,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static TextStyle blueTitleText = const TextStyle(
    color: ColorTheme.blue,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static TextStyle buttonTextStyl = const TextStyle(
      color: ColorTheme.white,
      fontSize: 18,
      fontFamily: openSans,
      fontWeight: FontWeight.bold);
  static TextStyle textButtonStyl = const TextStyle(
    color: ColorTheme.yellow,
    fontFamily: openSans,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    decoration: TextDecoration.underline,
    decorationColor: ColorTheme.yellow,
    decorationThickness: 5,
  );
}
