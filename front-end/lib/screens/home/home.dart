import 'package:flutter/material.dart';
import 'package:front_end/routes/routes.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.vRouter.to(RoutesApp.model);
        },
        child: const Text(
          'HomePage',
        ),
      ),
    );
  }
}
