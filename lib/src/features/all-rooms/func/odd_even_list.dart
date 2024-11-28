import 'package:hotel_booking_app/src/features/all-rooms/service/model/all_room_data.dart';

class OddEvenList {
  oddEvenChecker(AllRoomData? roomData) {
    oddList.clear();
    eveList.clear();
    if (roomData!.success) {
      for (int i = 0; i < roomData.data.length; i++) {
        if (i % 2 == 0) {
          eveList.add(i);
        } else {
          oddList.add(i);
        }
      }
    }
  }

  List oddList = [];

  List eveList = [];
}
