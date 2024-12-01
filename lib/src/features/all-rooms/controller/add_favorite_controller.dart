import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/favorites/service/favorite_service.dart';
import 'package:hotel_booking_app/src/features/favorites/service/model/favoirte_data_model.dart';

class AddFavoriteController extends GetxController {
  final FavorateService service = FavorateService();
  final AuthService authService = AuthService();

  RxSet<int> favoriteIndexs = <int>{}.obs;
  RxBool favLoading = false.obs;
  late FavoriteDataModel data;
  @override
  void onInit() {
    super.onInit();
    fetchFavorateData();
  }

  Future<void> fetchFavorateData() async {
    try {
      data = await service.getFavorites();
      if (data.success) {
        for (int i = 0; i <= data.data.favouriteData.length; i++) {
          favoriteIndexs.add(int.parse(
            data.data.favouriteData[i].roomNumber,
          ));
        }
      }
    } catch (e) {
      throw Exception("somthing went wrong, error: $e");
    }
  }

  void addFavorite(int roomNumber) async {
    if (!favoriteIndexs.contains(roomNumber)) {
      favoriteIndexs.add(roomNumber);

      try {
        favLoading.value = true;
        final Dio dio = Dio();
        var token = await authService.getToken();
        String url = api + addFavorites;
        await dio.post(url,
            data: {"room_number": roomNumber},
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));
      } catch (e) {
        throw Exception("something went wrong, error: $e");
      } finally {
        favLoading.value = false;
      }
    }
  }

  bool isFavorite(int roomNumber) {
    return favoriteIndexs.contains(roomNumber);
  }

  // void clearFavorites() {
  //   favoriteIndexs.clear();
  // }
}
