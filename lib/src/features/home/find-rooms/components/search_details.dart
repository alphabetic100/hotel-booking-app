import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/custom_tile_widget.dart';

class SearchDetails extends StatelessWidget {
  const SearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenSize.height * 0.37,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
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
                                "10% OFF",
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
                                    "3.3",
                                    style: CustomStyle.blueTextStyle,
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Text(
                            "101",
                            style: CustomStyle.blackStyle,
                          ),
                          CustomTileWidget(
                              child: Text(
                            "3 Guests",
                            style: CustomStyle.blueTextStyle,
                          )),
                          Row(
                            children: [
                              Text(
                                "\$100 USD",
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
                );
              }),
        )
      ],
    );
  }
}
