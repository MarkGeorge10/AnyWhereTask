import 'package:flutter/material.dart';

class AnimationViewModel extends ChangeNotifier {
  late Animation sizeAnimation;

  init(AnimationController controller) {
    sizeAnimation = Tween(begin: 50.0, end: 250.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5)));

    controller.addListener(() {
      notifyListeners();
    });
    controller.forward();
  }
}
