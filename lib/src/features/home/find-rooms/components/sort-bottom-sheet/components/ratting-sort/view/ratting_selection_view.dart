import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/ratting-sort/controller/ratting_controller.dart';

class RattingSelectionView extends StatelessWidget {
  RattingSelectionView({super.key});
  final RattingController rattingController = Get.put(RattingController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Obx(
                  () => GestureDetector(
                    onTap: () => rattingController.selectionChecker(index + 1),
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color:
                              rattingController.selectedIndex.value == index + 1
                                  ? ColorTheme.blue
                                  : ColorTheme.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: ColorTheme.blue)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${index + 1}",
                            style: rattingController.selectedIndex.value ==
                                    index + 1
                                ? CustomStyle.whiteStyle
                                : CustomStyle.regularStyle,
                          ),
                          Icon(
                            Icons.star,
                            color: ColorTheme.yellow,
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
