import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';

class GridComponents extends StatelessWidget {
  const GridComponents(
      {super.key,
      required this.roomNumber,
      required this.currentPrice,
      required this.oldPrice});
  final String roomNumber;
  final String currentPrice;
  final String oldPrice;

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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("$imageAsst/image1.png"),
                    fit: BoxFit.cover,
                  )),
                )),
          ),

          //room number
          SizedBox(
            width: Get.width,
            child: Text(
              roomNumber,
              style: CustomStyle.blackStyle,
              textAlign: TextAlign.start,
            ),
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
                  "\$$currentPrice - $oldPrice USD",
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
