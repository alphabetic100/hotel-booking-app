import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/favorites/controller/fav_loding_controller.dart';
import 'package:hotel_booking_app/src/features/favorites/service/model/favoirte_data_model.dart';

class FavorateService {
  Dio dio = Dio();
  AuthService service = AuthService();
  final FavLoadingController loadingController =
      Get.put(FavLoadingController());
  Future<void> postFavorites(int roomNumber) async {
    try {
      final response = await dio.post(
        api + addFavorite,
        data: {
          "room_number": roomNumber,
        },
      );
      if (response.statusCode == 200) {}
    } catch (e) {
      throw Exception("somethin went worng : $e");
    } finally {}
  }

  Future<FavoriteDataModel> getFavorites() async {
    loadingController.isFavLoading.value = true;
    var token = await service.getToken();
    try {
      final response = await dio.get(api + getFavorite,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        loadingController.isFavLoading.value = false;
        return FavoriteDataModel.fromJson(response.data);
      } else {
        throw Exception("something went worng");
      }
    } on DioException catch (e) {
      throw Exception("something went worng : $e");
    } finally {
      loadingController.isFavLoading.value = false;
    }
  }
}
