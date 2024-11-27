import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';

class GridComponents extends StatelessWidget {
  const GridComponents({super.key});
  // final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),

          //room number
          Text(
            "room number",
            style: CustomStyle.blackStyle,
          ),
          //Location Option
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: ColorTheme.grey,
              ),
              const HorizontalSpace(width: 5),
              const Text("Dhaka,Bangladesh"),
            ],
          ),
          //price option
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Text(
                  "\$cp - op USD",
                  style: CustomStyle.blueTextStyle,
                ),
                const Text(
                  "/Night",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
