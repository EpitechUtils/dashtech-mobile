import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends GetxService {
  ImagePicker picker;

  @override
  void onReady() {
    picker = ImagePicker();
    super.onReady();
  }

  Future<PickedFile> getImageFromGalery() async {
    return picker.getImage(source: ImageSource.gallery);
  }

  Future<PickedFile> getImageFromCamera() async {
    return picker.getImage(source: ImageSource.camera);
  }
}
