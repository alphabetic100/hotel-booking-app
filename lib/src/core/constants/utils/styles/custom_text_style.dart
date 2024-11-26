import 'package:flutter/material.dart';

import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';

class CustomStyle {
  static TextStyle titleStyle = TextStyle(
    color: ColorTheme.blue,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static TextStyle whiteTitleStyle = TextStyle(
    color: ColorTheme.white,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static TextStyle redTitleStyle = const TextStyle(
    color: Colors.red,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static TextStyle regularStyle = TextStyle(
    color: ColorTheme.grey,
    fontFamily: openSans,
    fontSize: 15,
  );
   static TextStyle whiteStyle = TextStyle(
    color: ColorTheme.white,
    fontFamily: openSans,
    fontSize: 15,
  );
  static TextStyle yellowStyle = TextStyle(
    color: ColorTheme.yellow,
    fontFamily: openSans,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
    static TextStyle blueTextStyle = TextStyle(
    color: ColorTheme.blue,
    fontFamily: openSans,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static TextStyle textFieldTitle = TextStyle(
    color: ColorTheme.grey,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle blackTitleText = TextStyle(
    color: ColorTheme.black,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static TextStyle blueTitleText = TextStyle(
    color: ColorTheme.blue,
    fontFamily: nunito,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static TextStyle buttonTextStyl = TextStyle(
      color: ColorTheme.white,
      fontSize: 18,
      fontFamily: openSans,
      fontWeight: FontWeight.bold);
  static TextStyle textButtonStyl = TextStyle(
    color: ColorTheme.yellow,
    fontFamily: openSans,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    decoration: TextDecoration.underline,
    decorationColor: ColorTheme.yellow,
    decorationThickness: 5,
  );
}
