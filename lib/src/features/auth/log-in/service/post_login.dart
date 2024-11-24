
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/error_text_controller.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/loading_controller.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/data/login_data.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/temp/login_values.dart';

class PostLogin {
  final dio = Dio();
  bool loginError = false;
  final LoadingController loadingController = Get.put(LoadingController());
  final ApiErrorTextController apiErrorTextController =
      Get.find<ApiErrorTextController>();
  Future<SignInData?> userLogIn() async {
    try {
      loadingController.isLoading.value = true;
      final response = await dio.post(api + signIn, data: {
        "email": emailValue,
        "password": passwordValue,
      });
      if (response.statusCode == 200) {
        loginError = false;
        final signInData = SignInData.fromJson(response.data);
        token = signInData.data.token;
        return signInData;
      } else if (response.statusCode == 404) {
        loginError = true;
        apiErrorTextController.massage.value = "Something Went Wrong";
      }
      return null;
    } catch (e) {
      throw Exception(e);
    } finally {
      loadingController.isLoading.value = false;
    }
  }
}
