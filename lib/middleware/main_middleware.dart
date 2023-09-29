import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get_storage/get_storage.dart';

class MainMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (GetStorage().read('token') == null) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
