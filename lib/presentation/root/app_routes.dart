import 'package:flutter/material.dart';
import 'package:flutter_example_01/presentation/screen/article/article_screen.dart';
import 'package:flutter_example_01/presentation/screen/blank/blank_screen.dart';
import 'package:flutter_example_01/presentation/screen/home/home_screen.dart';
import 'package:flutter_example_01/presentation/screen/settings/settings_screen.dart';

class AppRoutes {
  static const home = "/";
  static const settings = "/settings";
  static const article = "/article";
}

class AppRoutesMapper {
  static Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.home:
            return const HomeScreen();
          case AppRoutes.settings:
            return const SettingsScreen();
          case AppRoutes.article:
            return const ArticleScreen();
          default:
            return const BlankScreen();
        }
      },
    );
  }
}
