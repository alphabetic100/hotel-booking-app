import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height * 0.6,
      width: ScreenSize.width,
      decoration: BoxDecoration(
        color: ColorTheme.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "cancel",
                    style: CustomStyle.blackStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "filter",
                    style: CustomStyle.blueTitleText,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "reset",
                    style: CustomStyle.blackStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
