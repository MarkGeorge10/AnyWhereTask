
import 'package:anywheretask/view_models/animation_view_model.dart';
import 'package:anywheretask/view_models/app_details_view_model.dart';
import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'app_route.dart';





void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppDetailsViewModel()),
      ChangeNotifierProvider.value(value: AnimationViewModel()),
      ChangeNotifierProvider.value(value: SearchViewModel()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: MyAppManager(appRouter: AppRouter()),
    ),
  ));
}

class MyAppManager extends StatelessWidget {
  final AppRouter appRouter;
  const MyAppManager({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define the initial route (optional)
      initialRoute: '/splash',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
