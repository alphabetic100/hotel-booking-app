import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';

class BookingDetailsItem extends StatelessWidget {
  const BookingDetailsItem(
      {super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CustomStyle.blackStyle,
        ),
        Text(
          value,
          style: TextStyle(
            color: ColorTheme.grey,
            fontFamily: nunito,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
