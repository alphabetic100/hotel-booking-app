import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/drop-down-box/controller/values/price_selection_sort_controller.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/drop-down-box/view/drop_down_box.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/ratting-sort/controller/ratting_controller.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/ratting-sort/view/ratting_selection_view.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/slider-price/controller/slide_controller.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/slider-price/view/slider_sort_view.dart';

class SortBottomSheet extends StatelessWidget {
  SortBottomSheet({super.key});
  final PriceSelectionSortController priceSelectionSortController =
      Get.put(PriceSelectionSortController());
  final RattingController rattingController = Get.put(RattingController());
  final SlideController slideController = Get.put(SlideController());
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: () {
                      priceSelectionSortController.selectedValue.value = "All";
                      rattingController.selectedIndex.value = 0;
                      slideController.startValue.value = 90;
                      slideController.endValue.value = 150;
                    },
                    child: Text(
                      "reset",
                      style: CustomStyle.blackStyle,
                    ),
                  ),
                ],
              ),
              Text(
                "Sort by",
                style: CustomStyle.blackStyle,
              ),
              const VerticalSpace(height: 15),
              DropDownBox(),
              const VerticalSpace(height: 15),
              Text(
                "Ratting",
                style: CustomStyle.blackStyle,
              ),
              const VerticalSpace(height: 15),
              RattingSelectionView(),
              const VerticalSpace(height: 15),
              Text(
                "Price Ranges",
                style: CustomStyle.blackStyle,
              ),
              SliderSortView(),
              const VerticalSpace(height: 15),
              Center(
                child: CustomButton(
                    onTap: () {
                      //Filter logics call here
                    },
                    child: Center(
                      child: Text(
                        "Filter Result",
                        style: CustomStyle.buttonTextStyl,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
