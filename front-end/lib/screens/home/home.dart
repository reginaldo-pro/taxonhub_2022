import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/icons/icons.dart';
import 'package:front_end/widgets/buttons/buttom_modal.dart';
import 'package:front_end/widgets/buttons/buttom_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ButtomSearch(
            title: 'Busca Taxonômica',
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ButtomSearch(
            title: 'Busca de Ocorrências',
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ButtonModal(
            title: 'Cancel',
            color: ColorsApp.backButton,
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ButtonModal(
            title: 'OK',
            color: ColorsApp.confirmButton,
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ButtonModal(
            title: 'Importar arquivo',
            iconData: IconsApp.uploud,
            color: ColorsApp.fileButton,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
