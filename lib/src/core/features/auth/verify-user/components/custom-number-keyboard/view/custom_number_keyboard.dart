import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class CustomNumberKeyboard extends StatelessWidget {
  const CustomNumberKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.white,
      width: Get.width,
      child: Align(
        alignment: Alignment.topCenter,
        child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 70,
              mainAxisSpacing: 10,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              if (index == 9) {
                return Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        ".",
                        style: CustomStyle.blackTitleText,
                      ),
                    ),
                  ),
                );
              }
              if (index == 10) {
                return Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "0",
                        style: CustomStyle.blackTitleText,
                      ),
                    ),
                  ),
                );
              }
              if (index == 11) {
                return Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.backspace_sharp,
                      size: 18,
                    )),
                  ),
                );
              }
              return Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: CustomStyle.blackTitleText,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
