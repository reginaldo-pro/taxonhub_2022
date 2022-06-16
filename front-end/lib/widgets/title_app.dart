import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'TaxonHUB',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: ColorsApp.tropicalForest,
      ),
    );
  }
}
