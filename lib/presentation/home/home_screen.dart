import 'package:flutter/material.dart';

import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/presentation/image_blog/landing_blog_screen.dart';
import 'package:mindlink_blog/presentation/text_blog/text_screen.dart';
import 'package:mindlink_blog/presentation/video_blog/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    LandingTextScreen(),
    LandingBlogScreen(),
    VideoScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.darkgery,
          unselectedItemColor: AppColors.lightGreyTextColor,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.text_format),
              label: "Text",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: "Image",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              label: "Video",
            )
          ]),
    );
  }
}
