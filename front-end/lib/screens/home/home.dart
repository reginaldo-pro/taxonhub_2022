import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'HomePage',
      ),
    );
  }
}
