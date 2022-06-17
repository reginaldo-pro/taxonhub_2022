import 'package:flutter/material.dart';

class BodyModal extends StatelessWidget {
  const BodyModal({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: child,
    );
  }
}
