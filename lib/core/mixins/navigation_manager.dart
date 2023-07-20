import 'package:flutter/material.dart';

mixin NavigationManager {
  void navigateTo(String routeName, BuildContext context, {clear = false}) {
    if (clear) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushReplacementNamed(routeName);
    }
  }
}
