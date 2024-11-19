import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onTap, required this.title});
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Text(
        title,
        style: CustomStyle.textButtonStyl,
        
      ),
    );
  }
}
