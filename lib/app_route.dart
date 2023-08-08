import 'package:anywheretask/view/home_page/home_page.dart';
import 'package:anywheretask/view/topic_details/topic_details.dart';
import 'package:flutter/material.dart';

import 'splash.dart';


class AppRouter {
  AppRouter();
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case MyHomePage.routeName:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case TopicWebViewScreen.routeName:
        final args = settings.arguments as Map<String, String?>;
        final selectedUrl = args['selectedUrl'] ?? "Default URL";

          return MaterialPageRoute(builder: (_) => TopicWebViewScreen(selectedUrl:selectedUrl,));


      // case SignUpScreen.routeName:
      //   return MaterialPageRoute(builder: (_) =>  const SignUpScreen());

      default:
        return null;
    }
  }
}
