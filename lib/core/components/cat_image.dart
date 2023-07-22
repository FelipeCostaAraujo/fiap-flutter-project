import 'package:flutter/material.dart';
import 'package:mobr1/generated/assets.dart';

class CatImage extends StatelessWidget {
  const CatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesCat,
      fit: BoxFit.cover,
      width: 200,
      height: 200,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
