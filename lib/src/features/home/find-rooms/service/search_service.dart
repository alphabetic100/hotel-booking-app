import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/controller/search_loading_controller.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/service/model/search_data.dart';

class SearchService {
  Dio dio = Dio();
  AuthService service = AuthService();
  final SearchLoadingController loadingController =
      Get.put(SearchLoadingController());
  Future<SearchData> getSearchRoom(String checkIn, String checkOut) async {
    var token = await service.getToken();
    final queryParams = {
      'check_in_date': checkIn,
      'check_out_date': checkOut,
    };
    try {
      loadingController.isLoading.value = true;
      final response = await dio.get(api + queryUrl,
          queryParameters: queryParams,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
     
      if (response.statusCode == 200) {
        loadingController.isLoading.value = false;
        return SearchData.fromJson(response.data);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      loadingController.isLoading.value = false;

      throw Exception("Something went wrong, error: $e");
    } finally {
      loadingController.isLoading.value = false;
    }
  }
}
