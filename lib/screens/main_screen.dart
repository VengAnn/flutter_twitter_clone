import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_clone/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        builder: (_) {
          switch (_controller.currentIndex) {
            case 0:
              return _controller.lsScreens[_controller.currentIndex];
            case 1:
              return _controller.lsScreens[_controller.currentIndex];
            case 2:
              return _controller.lsScreens[_controller.currentIndex];
            case 3:
              return _controller.lsScreens[_controller.currentIndex];
            default:
              return Container(
                child: const Center(
                  child: Text('News Feed'),
                ),
              );
          }
        },
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (_) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _controller.currentIndex,
            onTap: (value) {
              _controller.currentIndex = value;
              _controller.update();
            },
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: 'News feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
