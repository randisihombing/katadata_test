import 'package:flutter/cupertino.dart';
import 'package:test_tehnical/helper/pages.dart';
import 'package:test_tehnical/splash/splash_screen.dart';
import 'package:test_tehnical/view/home.dart';

import 'enter_exit_route.dart';

class MyRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.splash:
        return EnterExitRoute(settings: settings, page: const SplashScreen());
      case Pages.home:
        return EnterExitRoute(settings: settings, page: const Home());
      default:
        return EnterExitRoute(settings: settings, page: const SplashScreen());
    }
  }
}
