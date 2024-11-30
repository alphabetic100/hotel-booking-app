import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/slider-price/controller/slide_controller.dart';

class SliderSortView extends StatelessWidget {
  SliderSortView({super.key});
  final SlideController slideController = Get.put(SlideController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        child: Center(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RangeSlider(
                  min: 10,
                  max: 300,
                  values: RangeValues(
                      slideController.startValue.value.toDouble(),
                      slideController.endValue.value.toDouble()),
                  onChanged: (value) {
                    slideController.slidlistener(
                        value.start.toInt(), value.end.toInt());
                  },
                ),
                const VerticalSpace(height: 10),
                Text(
                  "\$${slideController.startValue.value} - \$${slideController.endValue.value}",
                  style: CustomStyle.blackStyle,
                ),
              ],
            ),
          ),
        ));
  }
}
