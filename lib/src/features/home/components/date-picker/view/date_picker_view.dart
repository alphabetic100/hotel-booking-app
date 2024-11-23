import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/features/home/components/date-picker/controller/date_picker_controller.dart';
import 'package:intl/intl.dart';

class DateSelecterView {
  final DatePickerController checkInController =
      Get.put(DatePickerController());
  final DatePickerController checkOutController =
      Get.put(DatePickerController());
  Future<void> checkInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final String formatedDate = DateFormat("dd/MM/yy").format(picked);
      checkInController.checkInDate.value = formatedDate;
    } else {
      checkInController.checkInDate.value = "DD/MM/YY";
    }
  }

  Future<void> checkOutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final String formatedDate = DateFormat("dd/MM/yy").format(picked);
      checkOutController.checkOutDate.value = formatedDate;
    } else {
      checkOutController.checkOutDate.value = "DD/MM/YY";
    }
  }
}
