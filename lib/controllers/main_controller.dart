import 'package:get/get.dart';
import 'package:twitter_clone/screens/main/news_feed_screen.dart';
import 'package:twitter_clone/screens/main/notification_screen.dart';
import 'package:twitter_clone/screens/main/profile_screen.dart';
import 'package:twitter_clone/screens/main/search_screen.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  List lsScreens = const [
    NewsFeedScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
}
