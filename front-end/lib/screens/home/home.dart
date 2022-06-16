import 'package:flutter/material.dart';
import 'package:front_end/widgets/buttons/buttom_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
