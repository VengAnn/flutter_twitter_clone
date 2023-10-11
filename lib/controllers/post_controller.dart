import 'dart:io';

import 'package:get/get.dart';
import 'package:twitter_clone/services/api_helper.dart';

class PostController extends GetxController {
  final _apiHelper = APIHelper();

  void post({required String caption, File? photo}) async {
    try {
      final success =
          await _apiHelper.createPost(caption: caption, photo: photo);
      if (success) {
        Get.back(result: true);
      } else {
        Get.snackbar("Error", "Failed to CreatePost");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
