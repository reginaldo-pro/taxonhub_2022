import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/widgets/settings/title_app.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: const TitleApp(),
      backgroundColor: ColorsApp.backgroundAppBar,
    );
  }
}
