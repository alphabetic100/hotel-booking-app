import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/all-rooms/components/categories_view.dart';
import 'package:hotel_booking_app/src/features/all-rooms/components/rooms_list_view.dart';

class AllRooms extends StatelessWidget {
  const AllRooms({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: ScreenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "All",
                    style: CustomStyle.blackTitleText,
                  ),
                  const HorizontalSpace(width: 10),
                  Text(
                    "Rooms",
                    style: CustomStyle.blueTitleText,
                  )
                ],
              ),
            ),
            const VerticalSpace(height: 10),
            Text(
              "Explore the best deal here!",
              style: CustomStyle.regularStyle,
            ),
            const VerticalSpace(height: 10),
            Text(
              "categories",
              style: CustomStyle.titleStyle,
            ),
            SizedBox(
              height: 60,
              width: ScreenSize.width,
              child: CategoriesView(title: categories),
            ),
            const VerticalSpace(height: 10),
            Expanded(
              child: SizedBox(
                height: 400,
                width: ScreenSize.width,
                child: RoomsListView(),
                //     height: ScreenSize.height * 0.6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
