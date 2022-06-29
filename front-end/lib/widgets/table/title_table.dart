import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class TitleTable extends StatelessWidget {
  const TitleTable({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
        bottom: 30,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
          color: ColorsApp.titleTable,
        ),
      ),
    );
  }
}
