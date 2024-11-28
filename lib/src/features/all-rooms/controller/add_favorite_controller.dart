import 'package:get/get.dart';

class AddFavoriteController extends GetxController {
  RxSet<int> favoriteIndexs = <int>{}.obs;

  void addFavorite(int index) {
    favoriteIndexs.add(index);
  }

  bool isFavorite(int index) {
    return favoriteIndexs.contains(index);
  }

  // void clearFavorites() {
  //   favoriteIndexs.clear(); 
  // }
}
