import 'package:hotel_booking_app/src/features/global/data/profile_data_model.dart';
import 'package:hotel_booking_app/src/features/global/services/get_profile_details.dart';

ProfileService service = ProfileService();
late ProfileDataModel profileData;
void fetchProfileDetails() async {
  profileData = await service.getProfileDetails();
}
