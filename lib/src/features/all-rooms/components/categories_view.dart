import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/features/all-rooms/controller/categories_controller.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key, required this.title});
  final List<String> title;
  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.changeIndex(index);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: controller.currentIndex.value == index
                            ? Colors.white
                            : ColorTheme.blue,
                        border: Border.all(
                            color: controller.currentIndex.value == index
                                ? ColorTheme.grey
                                : ColorTheme.blue)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          title[index],
                          style: controller.currentIndex.value == index
                              ? CustomStyle.blueTextStyle
                              : CustomStyle.whiteStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}

List<String> categories = [
  "all",
  "Standard",
  "Deluxe",
  "Suite",
  "Family",
  "Presidential",
];
