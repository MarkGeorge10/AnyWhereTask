import 'package:anywheretask/res/colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        child: const CircularProgressIndicator(
          color: black,

        )
    );
  }
}
