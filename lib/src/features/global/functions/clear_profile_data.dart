import 'package:hotel_booking_app/src/features/global/data/profile_data_model.dart';
import 'package:hotel_booking_app/src/features/global/functions/fetch_profile_details.dart';

void clearProfileDetails() {
  profileData = ProfileDataModel(
    success: false,
    message: '',
    data: Data(
      id: 0,
      name: '',
      email: '',
      rule: '',
      emailVerifiedAt: null,
      profileUrl: null,
      phone: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  );
}
