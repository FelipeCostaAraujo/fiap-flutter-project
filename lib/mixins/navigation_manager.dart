import 'package:flutter/material.dart';

mixin NavigationManager {
  void navigateTo(String routeName, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }
}
