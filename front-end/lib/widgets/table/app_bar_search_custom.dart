import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/icons/icons.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/buttons/button_modal.dart';
import 'package:vrouter/vrouter.dart';

class AppBarSearchCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSearchCustom({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarSearchCustom> createState() => _AppBarSearchCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

class _AppBarSearchCustomState extends State<AppBarSearchCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Container(
        margin: const EdgeInsets.only(
          right: 30,
        ),
        alignment: Alignment.topLeft,
        child: ButtonModal(
          title: context.T.backInitial,
          color: ColorsApp.success,
          iconData: IconsApp.back,
          onPressed: () {
            context.vRouter.to('/');
          },
        ),
      ),
      backgroundColor: ColorsApp.backgroundAppBar,
    );
  }
}
