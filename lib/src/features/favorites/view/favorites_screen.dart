import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/favorites/service/favorite_service.dart';
import 'package:hotel_booking_app/src/features/favorites/service/model/favoirte_data_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavorateService _service = FavorateService();
  late FavoriteDataModel dataModel;
  void fetchFavoriteData() async {
    dataModel = await _service.getFavorites();
  }

  @override
  void initState() {
    fetchFavoriteData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your",
                      style: CustomStyle.blackTitleText,
                    ),
                    const HorizontalSpace(width: 10),
                    Text(
                      "Favorites",
                      style: CustomStyle.blueTitleText,
                    )
                  ],
                ),
              ),
              const VerticalSpace(height: 10),
              Text(
                "See all your favorite items in one place!",
                style: CustomStyle.regularStyle,
              ),
              const VerticalSpace(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
