import 'package:shared_preferences/shared_preferences.dart';

class ImageService {
  Future<void> saveImage(String image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("image", image);
  }

  Future<String?> getImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("image");
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("image");
  }
}
