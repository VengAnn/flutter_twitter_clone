import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/screens/main_screen.dart';
import '../services/api_helper.dart';
import 'package:quickalert/quickalert.dart';

class AuthController extends GetxController {
  File? profile;
  final _imagePicker = ImagePicker();
  final _apiHelper = APIHelper();

  void setProfile(File? file) {
    profile = file;
    update();
  }

  void pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setProfile(File(pickedFile.path)); //convert xFile to File;
  }

  //
  void register(
      {required String email, required String name, required password}) async {
    try {
      final res = await _apiHelper.register(
        email: email,
        name: name,
        password: password,
        profile: profile,
      );
      if (res) {
        //check is compled success
        QuickAlert.show(
          barrierDismissible:
              false, //allow click one this not different can't close
          context: Get.context!,
          type: QuickAlertType.success,
          text: 'Register Successfully',
          onConfirmBtnTap: () {
            Get.back(); //back 1 close QuickAlert
            Get.back(); //go to login screen
          },
        );
      } else {
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Register failed!',
        );
      }
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: e.toString(),
      );
    }
  }

  //for login
  void login({required String email, required String password}) async {
    final res = await _apiHelper.login(email: email, password: password);

    try {
      //bring user to home screen
      Get.off(() => const MainScreen()); //get off can't back
    } catch (e) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'login failed!',
      );
    }
  }
}
