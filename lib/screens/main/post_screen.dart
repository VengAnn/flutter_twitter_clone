import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:twitter_clone/controllers/post_controller.dart';

class PostScreen extends StatelessWidget {
  PostScreen({
    required this.photo,
    super.key,
  });
  final File photo;
  final _controller = Get.put(PostController());
  final _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text("Create Post"),
        actions: [
          TextButton(
            onPressed: () {
              _controller.post(
                caption: _captionController.text,
                photo: photo,
              );
            },
            child: const Text(
              "Post",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  child: Text("PH"),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _captionController,
                    decoration: const InputDecoration(
                      hintText: "Caption",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            //show image when pick photo already
            Image.file(photo),
          ],
        ),
      ),
    );
  }
}
