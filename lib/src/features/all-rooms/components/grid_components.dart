import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/all-rooms/controller/add_favorite_controller.dart';

class GridComponents extends StatelessWidget {
  GridComponents({
    super.key,
    required this.roomNumber,
    required this.currentPrice,
    required this.oldPrice,
    required this.index,
  });
  final int index;
  final String roomNumber;
  final String currentPrice;
  final String oldPrice;
  final AddFavoriteController favoriteController =
      Get.put(AddFavoriteController());
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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("$imageAsst/image1.png"),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            favoriteController
                                .addFavorite(int.parse(roomNumber));
                          },
                          child: Icon(
                            favoriteController.isFavorite(int.parse(roomNumber))
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: ColorTheme.blue,
                            size: 25,
                          ),
                        ),
                      )),
                ],
              ),
            ),
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
              SizedBox(
                width: Get.width * 0.31,
                child: const Text(
                  "Dhaka,Bangladesh",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          //price option
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Text(
                  "\$$currentPrice-$oldPrice USD",
                  style: CustomStyle.blueTextStyle,
                ),
                SizedBox(
                  width: Get.width * 0.113,
                  child: const Text(
                    "/Night",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
