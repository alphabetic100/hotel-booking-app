import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        XTextField(
          id: 1,
        ),
        XTextField(
          id: 2,
        ),
        XTextField(
          id: 3,
        ),
        XTextField(
          id: 4,
        ),
      ],
    );
  }
}

class XTextField extends StatelessWidget {
  const XTextField({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    int focusCheck = 1;
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        onChanged: (value) {
          focusCheck = id;
          if (value.length == 1 && focusCheck < 4) {
            FocusScope.of(context).nextFocus();
          } else if (value.length == 1) {
            FocusScope.of(context).unfocus();
          }
        },
        style: TextStyle(fontSize: 25, color: ColorTheme.blue),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
