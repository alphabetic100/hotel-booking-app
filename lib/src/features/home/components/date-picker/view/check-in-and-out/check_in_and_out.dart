import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/home/components/date-picker/controller/date_picker_controller.dart';
import 'package:hotel_booking_app/src/features/home/components/date-picker/view/date_picker_view.dart';

class CheckInAndOut extends StatelessWidget {
  CheckInAndOut({super.key});
  final DateSelecterView selecterView = DateSelecterView();
  final DatePickerController datePickerController =
      Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Check-in",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const VerticalSpace(height: 10),
            SizedBox(
              width: ScreenSize.width * 0.42,
              child: Obx(
                () => TextField(
                  decoration: InputDecoration(
                      hintText: datePickerController.checkInDate.value,
                      hintStyle: CustomStyle.textFieldTitle,
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                  readOnly: true,
                  onTap: () => selecterView.checkInDate(context),
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Check-out",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const VerticalSpace(height: 10),
            SizedBox(
              width: ScreenSize.width * 0.42,
              child: Obx(
                () => TextField(
                  decoration: InputDecoration(
                      hintText: datePickerController.checkOutDate.value,
                      hintStyle: CustomStyle.textFieldTitle,
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      )),
                  readOnly: true,
                  onTap: () => selecterView.checkOutDate(context),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
