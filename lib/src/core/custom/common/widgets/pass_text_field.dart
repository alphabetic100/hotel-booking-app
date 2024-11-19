import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class PassTextField extends StatelessWidget {
  const PassTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: CustomStyle.textFieldTitle,
          prefixIcon: Transform.rotate(
              angle: pi * 0.7,
              child: Icon(
                Icons.key_outlined,
                color: ColorTheme.grey,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )),
    );
  }
}
