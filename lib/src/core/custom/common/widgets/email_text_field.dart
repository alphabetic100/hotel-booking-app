import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, this.onChange, this.onSubmit});
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      onSubmitted: onSubmit,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Email Address",
          hintStyle: CustomStyle.textFieldTitle,
          prefixIcon: Icon(
            Icons.mail_outline,
            color: ColorTheme.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )),
    );
  }
}
