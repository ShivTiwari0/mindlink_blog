import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindlink_blog/data/model/blog_model.dart';
import 'package:mindlink_blog/data/model/text_news_model.dart';
import 'package:mindlink_blog/data/model/video_model.dart';
import 'package:mindlink_blog/presentation/image_blog/blog_detail_screen.dart';
import 'package:mindlink_blog/presentation/image_blog/landing_blog_screen.dart';

import 'package:mindlink_blog/presentation/home/home_screen.dart';
import 'package:mindlink_blog/presentation/splash/splash_screen.dart';
import 'package:mindlink_blog/presentation/text_blog/text_details.dart';
import 'package:mindlink_blog/presentation/text_blog/text_screen.dart';
import 'package:mindlink_blog/presentation/video_blog/video_player_screen.dart';

class Routes {
  static Route? onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LandingBlogScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const LandingBlogScreen());
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case BlogDetailScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlogDetailScreen(
                  blog: settings.arguments as BlogModel,
                ));

      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());

      case TextDetails.routeName:
        return MaterialPageRoute(
          builder: (context) =>
              TextDetails(textNewsModel: settings.arguments as TextNewsModel),
        );
      case VideoPlayerScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(
            videoModel: settings.arguments as VideoModel,
          ),
        );

      default:
        return null;
    }
  }
}
