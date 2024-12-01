import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/room-details/controller/detail_loading_controller.dart';
import 'package:hotel_booking_app/src/features/room-details/service/model/room_details.dart';

class RoomDetailsService {
  Dio dio = Dio();
  AuthService service = AuthService();
  final DetailLoadingController loadingController =
      Get.put(DetailLoadingController());
  Future<RoomDetails> getRoomDetails(String roomNumber) async {
    var token = await service.getToken();
    String url = api + roomDetails + roomNumber;

    try {
      loadingController.isLoading.value = true;
      final response = await dio.get(
        url,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      
      if (response.statusCode == 200) {
        loadingController.isLoading.value = false;
        return RoomDetails.fromJson(response.data);
      } else {
        throw Exception("Something went wrong");
      }
    }
     catch (e) {
      throw Exception("something went wrong, error: $e");
    } 
    finally {
      loadingController.isLoading.value = false;
    }
  }
}
