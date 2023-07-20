import 'package:flutter/material.dart';

void showSnackMessage(BuildContext context, String msg) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(msg),
        ),
      ),
    );
  });
}
