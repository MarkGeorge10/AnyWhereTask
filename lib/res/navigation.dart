import 'package:flutter/material.dart';

void changeScreen(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void changeScreenReplacement(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, route);
}
