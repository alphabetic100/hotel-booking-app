import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/favorites/components/favorite_list.dart';
import 'package:hotel_booking_app/src/features/favorites/controller/fav_loding_controller.dart';
import 'package:hotel_booking_app/src/features/favorites/service/favorite_service.dart';
import 'package:hotel_booking_app/src/features/favorites/service/model/favoirte_data_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavorateService _service = FavorateService();
  final FavLoadingController loadingController =
      Get.put(FavLoadingController());
  FavoriteDataModel? favoriteData;

  Future fetchFavoriteData() async {
    favoriteData = await _service.getFavorites();
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
            child: Obx(
              () => loadingController.isFavLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorTheme.blue,
                      ),
                    )
                  : Column(
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
                        Expanded(
                          child: favoriteData!.data.favouriteData.isEmpty
                              ? const Center(
                                  child: Text("You Have No Favorites"),
                                )
                              : GridView.builder(
                                  itemCount:
                                      favoriteData!.data.favouriteData.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: Get.height * 0.35),
                                  itemBuilder: (context, index) {
                                    List<FavouriteDatum> favData =
                                        favoriteData!.data.favouriteData;
                                    return FavoriteList(
                                      roomNumber: favData[index].roomNumber,
                                      addedDate:
                                          favData[index].createdAt.toString(),
                                    );
                                  }),
                        )
                      ],
                    ),
            )),
      ),
    );
  }
}
