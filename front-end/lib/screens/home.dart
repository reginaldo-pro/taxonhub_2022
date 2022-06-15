import 'package:flutter/material.dart';
import 'package:front_end/widgets/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
