import 'dart:async';

import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'res/constants.dart';
import 'res/navigation.dart';
import 'view/home_page.dart';
import 'view_models/animation_view_model.dart';
import 'view_models/app_details_view_model.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 2), () {

          changeScreenReplacement(context, MyHomePage.routeName);

    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider<AnimationViewModel>(
        create: (context) => AnimationViewModel()..init(controller),
        child: Consumer<AnimationViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    logoTransparent,
                    height: viewModel.sizeAnimation.value,
                    width: viewModel.sizeAnimation.value,
                  )),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
