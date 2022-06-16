import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:vrouter/vrouter.dart';

class ModalCustomApp extends StatefulWidget {
  const ModalCustomApp({Key? key}) : super(key: key);

  @override
  State<ModalCustomApp> createState() => _ModalCustomAppState();
}

class _ModalCustomAppState extends State<ModalCustomApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blursModalBackground,
      body: Center(
        child: Container(
          width: 700,
          height: 300,
          decoration: BoxDecoration(
            color: ColorsApp.backgroundModal,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ColorsApp.dividerModel,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            boxShadow: const [
              BoxShadow(
                color: ColorsApp.shedowBoxModel,
                blurRadius: 5.0,
                spreadRadius: 1.5,
                offset: Offset(0, 3),
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeaderModal(),
                const DividerCustomModal(),
                Expanded(
                  child: Column(),
                ),
                const DividerCustomModal(),
                const FooterModal(),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class DividerCustomModal extends StatelessWidget {
  const DividerCustomModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorsApp.dividerModel,
      thickness: 1.0,
      height: 1.0,
    );
  }
}

class FooterModal extends StatelessWidget {
  const FooterModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Close'),
      onPressed: () => context.vRouter.pop(),
    );
  }
}

class HeaderModal extends StatelessWidget {
  const HeaderModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        children: const [
          Icon(
            Icons.warning_amber_outlined,
            size: 38,
            color: ColorsApp.warning,
          ),
          Icon(
            Icons.disabled_by_default_outlined,
            size: 38,
            color: ColorsApp.error,
          ),
          Icon(
            Icons.check_circle_outline,
            size: 38,
            color: ColorsApp.success,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'Importar arquivo',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
