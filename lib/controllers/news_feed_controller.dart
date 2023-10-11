import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_clone/models/post_res_model.dart';
import 'dart:io';
import 'package:twitter_clone/screens/main/post_screen.dart';
import 'package:twitter_clone/services/api_helper.dart';

class NewsFeedController extends GetxController {
  final _imagePicker = ImagePicker();
  File? photo;
  final _api = APIHelper();

  PostResModel posts = PostResModel();

  @override
  void onInit() {
    getAllPost();
    super.onInit();
  }

  void pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    photo = File(pickedFile.path); //convert xfile to file flutter widget
    final data = await Get.to(
      () => PostScreen(
        photo: photo!,
      ),
    );
    //if data not null getAllPost again
    if (data != null) {
      getAllPost();
    }
  }

  void getAllPost() async {
    try {
      final res = await _api.getAllPosts();
      posts = res; //pass res to post obj of PostResModel
      print("Refresh data");
      update();
      // print(res);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
    }
  }

  void likeDisLike({required int postId}) async {
    try {
      final res = await _api.likeDisLike(postId: postId);
      print("LikeDisLike $res");
      //find the post index
      final index = posts.data!.indexWhere((element) => element.id == postId);
      //update like status
      posts.data![index].liked = !posts.data![index].liked!;
      //update like count
      if (posts.data![index].liked!) {
        //check is liked increment likesCount
        posts.data![index].likesCount = posts.data![index].likesCount! + 1;
      } else {
        posts.data![index].likesCount = posts.data![index].likesCount! - 1;
      }
      update();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
