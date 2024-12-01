import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/custom_tile_widget.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/service/model/search_data.dart';
import 'package:hotel_booking_app/src/features/room-details/view/room_details_screen.dart';

class SearchDetails extends StatelessWidget {
  const SearchDetails({super.key, required this.data});
  final SearchData data;

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenSize.height * 0.4,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RoomDetailsScreen(
                              roomNumber: data.data.roomData[index].roomNumber,
                              image: image1)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorTheme.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: ColorTheme.blue.withOpacity(0.2),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorTheme.blue.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 15,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: ScreenSize.height * 0.15,
                              width: ScreenSize.height * 0.25,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                      image1,
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            const VerticalSpace(height: 10),
                            Row(
                              children: [
                                CustomTileWidget(
                                    child: Text(
                                  "${data.data.roomData[index].discountPercentage}% OFF",
                                  style: CustomStyle.blueTextStyle,
                                )),
                                const HorizontalSpace(width: 15),
                                CustomTileWidget(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: ColorTheme.yellow,
                                    ),
                                    Text(
                                      data.data.roomData[index].rating
                                          .toString()
                                          .substring(0, 3),
                                      style: CustomStyle.blueTextStyle,
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            Text(
                              data.data.roomData[index].roomNumber,
                              style: CustomStyle.blackStyle,
                            ),
                            CustomTileWidget(
                                child: Text(
                              "${data.data.roomData[index].maxNumberGuest} Guests",
                              style: CustomStyle.blueTextStyle,
                            )),
                            Row(
                              children: [
                                Text(
                                  "\$${data.data.roomData[index].currentPrice} USD",
                                  style: CustomStyle.blueTextStyle,
                                ),
                                Text(
                                  "/Night",
                                  style: CustomStyle.regularStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
