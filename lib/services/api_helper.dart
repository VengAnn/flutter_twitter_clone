import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class APIHelper {
  final _dio = Dio();
  final _bashUrl = "http://10.0.2.2:8000/api"; //local for andriod

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

  Future<bool> login({required String email, required String password}) async {
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
        return true; //success
      }
      //failed
      return false;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}