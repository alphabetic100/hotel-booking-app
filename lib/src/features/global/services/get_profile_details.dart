import 'package:dio/dio.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/global/data/profile_data_model.dart';

class ProfileService {
  Dio dio = Dio();
  AuthService service = AuthService();
  Future<ProfileDataModel> getProfileDetails() async {
    var token = await service.getToken();
    try {
      final response = await dio.get(api + profile,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        return ProfileDataModel.fromJson(response.data);
      } else {
        throw Exception("something went worng");
      }
    } on DioException catch (e) {
      throw Exception("something went worng : $e");
    }
  }
}
