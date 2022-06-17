import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/widgets/modals/widgets/body_modal.dart';
import 'package:front_end/widgets/modals/widgets/divider_custom_modal.dart';
import 'package:front_end/widgets/modals/widgets/footer_modal.dart';
import 'package:front_end/widgets/modals/widgets/header_model.dart';

class ModalCustomApp extends StatefulWidget {
  const ModalCustomApp({
    Key? key,
    required this.header,
    required this.body,
    required this.footer,
  }) : super(key: key);

  final HeaderModal header;
  final BodyModal body;
  final FooterModal footer;

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
          width: 500,
          height: 250,
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
                widget.header,
                const DividerCustomModal(),
                Expanded(
                  child: widget.body,
                ),
                const DividerCustomModal(),
                widget.footer,
              ],
            );
          }),
        ),
      ),
    );
  }
}
