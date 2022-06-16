import 'package:flutter/material.dart';
import 'package:front_end/widgets/background.dart';
import 'package:front_end/widgets/title_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const TitleApp(),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      body: const Background(),
    );
  }
}
