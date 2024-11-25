import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class CustomTileButton extends StatelessWidget {
  const CustomTileButton({
    super.key,
    this.height = 50,
    required this.width,
    required this.title,
    required this.prefixIcon,
    required this.onTap,
    this.tileColor,
    this.iconColor,
    this.textStyle,
  });
  final double height;
  final double width;
  final String title;
  final IconData prefixIcon;
  final VoidCallback onTap;
  final Color? tileColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: ColorTheme.blue.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: tileColor ?? ColorTheme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(18)),
          child: ListTile(
            leading: Padding(
              padding: EdgeInsets.all(height * 0.1),
              child: Icon(
                prefixIcon,
                color: iconColor ?? ColorTheme.grey,
              ),
            ),
            title: Text(
              title,
              style: textStyle ?? CustomStyle.regularStyle,
            ),
          ),
        ),
      ),
    );
  }
}
