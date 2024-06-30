import 'package:flutter/material.dart';
import 'package:wordle/pages/404/not_found.dart';
import 'package:wordle/pages/game/game_page.dart';
import 'package:wordle/pages/home/home_page.dart';
import 'package:wordle/pages/settings/settings_page.dart';
import 'package:wordle/pages/splash/splash_page.dart';

class Routes {
  //initial route
  static String get initialRoute => splash;

  //routes
  static String home = "/";
  static String splash = "/splash";
  static String game = "/game";
  static String settings = "/settings";

  //unknown
  static String notFound = "/unknown";

  //GetPages
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      home: (context) => const HomePage(),
      splash: (context) => const SplashPage(),
      game: (context) => const GamePage(),
      settings: (context) => const SettingsPage(),
      notFound: (context) => const NotFoundPage(),
    };
  }
}
