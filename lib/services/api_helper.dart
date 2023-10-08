import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twitter_clone/models/user_login_res_model.dart';

import '../models/post_res_model.dart';

class APIHelper {
  final _dio = Dio();
  final _bashUrl = "http://10.0.2.2:8000/api"; //local for andriod
  //final _bashUrl = "http://10.0..2:8000/api"; //local for andriod
  final box = GetStorage();

  Future<bool> register({
    required String email,
    required String name,
    required String password,
    File? profile,
  }) async {
    try {
      var _formData = FormData.fromMap({
        "email": email,
        "name": name,
        "password": password,
        "c_password": password,
        "profile":
            profile != null ? await MultipartFile.fromFile(profile.path) : null,
      });

      final res = await _dio.post(
        "$_bashUrl/register",
        data: _formData,
        options: Options(
          headers: {"Accept": "application/json"},
          followRedirects: false,
          validateStatus: (status) => status! <= 500,
        ),
      );
      if (res.statusCode == 200) {
        // return res.data;
        return true;
      }
      if (res.statusCode == 500) {
        throw Exception('email already exists');
      }
      // print(res.data);
      return false;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<UserLoginResModel?> login(
      {required String email, required String password}) async {
    try {
      final res = await _dio.post(
        "$_bashUrl/login",
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {"Accept": "application/json"},
          followRedirects: false,
          validateStatus: (status) => status! <= 500,
        ),
      );
      if (res.statusCode == 200) {
        return UserLoginResModel.fromJson(res.data); //success
        //when login success backend will return user with data like name .. token ...
      }
      //failed
      return null;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<bool> createPost({required String caption, File? photo}) async {
    final token =
        box.read("token"); //get token from local storage when login save
    try {
      var _formData = FormData.fromMap({
        "caption": caption,
        "image":
            photo != null ? await MultipartFile.fromFile(photo.path) : null,
      });

      final res = await _dio.post(
        "$_bashUrl/posts",
        data: _formData,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          followRedirects: false,
          validateStatus: (status) => status! <= 500,
        ),
      );
      if (res.statusCode == 200) {
        print(res.data);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<PostResModel> getAllPosts() async {
    try {
      final res = await _dio.get(
        "$_bashUrl/posts",
        options: Options(
          headers: {
            "Accept": "application/json",
          },
          followRedirects: false,
          validateStatus: (status) => status! <= 500,
        ),
      );
      if (res.statusCode == 200) {
        return PostResModel.fromJson(res.data);
      }
      throw Exception(res.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
