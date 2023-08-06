import 'package:flutter/material.dart';

import 'splash.dart';


class AppRouter {
  AppRouter();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case LogInScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => LogInScreen());
      // case SignUpScreen.routeName:
      //   return MaterialPageRoute(builder: (_) =>  const SignUpScreen());

      default:
        return null;
    }
  }
}
