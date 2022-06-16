import 'package:flutter/material.dart';
import 'package:front_end/widgets/settings/app_bar_custom.dart';
import 'package:front_end/widgets/settings/background.dart';

class Main extends StatelessWidget {
  const Main({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarCustom(),
      body: Background(
        child: child,
      ),
    );
  }
}
