import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.child});
  final Callback? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 50,
        width: ScreenSize.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: ColorTheme.blue,
        ),
        child: child,
      ),
    );
  }
}
