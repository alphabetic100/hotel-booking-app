import 'package:dio/dio.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';

class BookingProcess {
  final Dio dio = Dio();
  final AuthService service = AuthService();
  Future postBookingProcess(
      String roomNumber, String checkIn, String checkOUt) async {
    var token = await service.getToken();
    String url = api + bookingProcess;
    Map<String, String> perimeter = {
      "room_number": roomNumber,
      "check_in_date": checkIn,
      "check_out_date": checkOUt,
    };
    try {
      final response = await dio.post(url,
          data: perimeter,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
