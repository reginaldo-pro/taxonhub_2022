import 'package:flutter/material.dart';

class TextBodyModal extends StatelessWidget {
  const TextBodyModal({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
