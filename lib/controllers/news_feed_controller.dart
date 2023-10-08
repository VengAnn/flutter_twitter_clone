import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:twitter_clone/screens/main/post_screen.dart';

class NewsFeedController extends GetxController {
  final _imagePicker = ImagePicker();
  File? photo;

  void pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    photo = File(pickedFile.path); //convert xfile to file flutter widget
    Get.to(
      () => PostScreen(
        photo: photo!,
      ),
    );
  }
}
