import 'package:dakgun/app.dart';
import 'package:dakgun/core/constants/app_constants.dart';
import 'package:dakgun/core/models/post.dart';
import 'package:dakgun/ui/views/account_view.dart';
import 'package:dakgun/ui/views/bookmark_view.dart';
import 'package:dakgun/ui/views/cari_barengan_view.dart';
import 'package:dakgun/ui/views/home_view.dart';
import 'package:dakgun/ui/views/inbox_view.dart';
import 'package:dakgun/ui/views/info_barengan_view.dart';
import 'package:dakgun/ui/views/post_barengan_view.dart';
import 'package:dakgun/ui/views/user_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.App:
        return MaterialPageRoute(builder: (_) => App());
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Bookmark:
        return MaterialPageRoute(builder: (_) => BookmarkView());
      case RoutePaths.Inbox:
        return MaterialPageRoute(builder: (_) => InboxView());
      case RoutePaths.Account:
        return MaterialPageRoute(builder: (_) => AccountView());
      case RoutePaths.User:
        var posts = settings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => UserView(user: posts.username));
      case RoutePaths.CariBarengan:
        return MaterialPageRoute(builder: (_) => CariBarenganView());
      case RoutePaths.InfoBarengan:
        var posts = settings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => InfoBarenganView(posts: posts));
      case RoutePaths.PostBarengan:
        return PageRouteBuilder(
            pageBuilder: (_, animation, secondaryAnimation) =>
                PostBarenganView(),
            transitionsBuilder: (_, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
