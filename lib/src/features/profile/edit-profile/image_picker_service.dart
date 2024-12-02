import 'package:get/get.dart';
import 'package:hotel_booking_app/src/features/profile/edit-profile/local-service/image_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends GetxController {
  RxBool isLoading = false.obs;
  RxString imagePath = "".obs;
  RxString tempImagePath = "".obs;
  final ImageService service = ImageService();

  @override
  void onInit() {
    super.onInit();
    loadSavedImage();
  }

  Future<void> loadSavedImage() async {
    final savedPath = await service.getImagePath();
    if (savedPath != null) {
      imagePath.value = savedPath;
    }
  }

  Future<void> takePhoto() async {
    try {
      isLoading.value = true;
      ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        tempImagePath.value = image.path;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectFromGallery() async {
    try {
      isLoading.value = true;
      ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        tempImagePath.value = image.path;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveImagePath(String path) async {
    await service.saveImage(path);
    imagePath.value = path;
  }
}
