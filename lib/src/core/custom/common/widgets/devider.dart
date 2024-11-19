import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';

class XDivider extends StatelessWidget {
  const XDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5,
      color: ColorTheme.grey,
      thickness: 1,
    );
  }
}