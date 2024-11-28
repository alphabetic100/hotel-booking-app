import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/all-rooms/controller/loading_controller.dart';
import 'package:hotel_booking_app/src/features/all-rooms/service/model/all_room_data.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';

class AllRoomService {
  final Dio dio = Dio();

  final AuthService service = AuthService();
  final AllRoomLoadingController controller =
      Get.put(AllRoomLoadingController());
  Future<AllRoomData> getAllRoomData() async {
    controller.isLoading.value = true;
    var token = await service.getToken();
    try {
      final response = await dio.get(api + getAllRoom,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        return AllRoomData.fromJson(response.data);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception("Something went wrong, error: $e");
    } finally {
      controller.isLoading.value = false;
    }
  }
}
