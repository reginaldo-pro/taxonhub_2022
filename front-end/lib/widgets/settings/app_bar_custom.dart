import 'package:flutter/material.dart';
import 'package:front_end/widgets/settings/title_app.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(500.0),
      child: AppBar(
        elevation: 0,
        title: const TitleApp(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
