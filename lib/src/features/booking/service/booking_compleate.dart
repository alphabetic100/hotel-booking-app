import 'package:dio/dio.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';

class BookingCompleate {
  final Dio dio = Dio();
  final AuthService service = AuthService();
  Future<void> postBookingCompleate(
    String roomNumber,
    String checkIn,
    String checkOut,
    String transactionNumber,
  ) async {
    var token = await service.getToken();
    String url = api + bookingCompleate;
    Map<String, String> perimeter = {
      "room_number": roomNumber,
      "check_in_date": checkIn,
      "check_out_date": checkOut,
      "transaction_number": transactionNumber,
    };
    try {
      await dio.post(url,
          data: perimeter,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
