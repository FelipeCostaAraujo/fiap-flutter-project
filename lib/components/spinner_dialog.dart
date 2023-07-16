import 'package:flutter/material.dart';

class SpinnerLoading extends StatelessWidget {
  const SpinnerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            const Text(
              "Aguarde...",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

void showLoading(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SpinnerLoading(),
    );
  });
}

void hideLoading(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
