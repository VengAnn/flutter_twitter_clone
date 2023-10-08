import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twitter_clone/middleware/main_middleware.dart';
import 'package:twitter_clone/screens/auth/login_screen.dart';
import 'package:twitter_clone/screens/main_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Twitter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginScreen(),
      initialRoute: '/main',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/main',
          page: () => MainScreen(),
          middlewares: [
            //middleWare check if token =null return to login screen
            //if already login return to mainscreen
            MainMiddleWare(),
          ],
        ),
      ],
    );
  }
}
