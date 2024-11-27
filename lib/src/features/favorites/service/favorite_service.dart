import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/favorites/controller/favorite_button_controller.dart';
import 'package:hotel_booking_app/src/features/favorites/service/model/favoirte_data_model.dart';

class FavorateService {
  Dio dio = Dio();
  AuthService service = AuthService();
  final FavoriteButtonController buttonController =
      Get.put(FavoriteButtonController());
  Future<void> postFavorites(int roomNumber) async {
    try {
      final response = await dio.post(
        api + addFavorite,
        data: {
          "room_number": roomNumber,
        },
      );
      if (response.statusCode == 200) {
        buttonController.addFavorate.value = true;
      }
    } catch (e) {
      buttonController.addFavorate.value = false;
      throw Exception("somethin went worng : $e");
    }
  }

  Future<FavoriteDataModel> getFavorites() async {
    var token = await service.getToken();
    try {
      final response = await dio.get(api + getFavorite,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        return FavoriteDataModel.fromJson(response.data);
      } else {
        throw Exception("something went worng");
      }
    } on DioException catch (e) {
      throw Exception("something went worng : $e");
    }
  }
}
