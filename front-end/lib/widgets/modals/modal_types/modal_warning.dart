import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/icons/icons.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/buttons/button_modal.dart';
import 'package:front_end/widgets/modals/modal.dart';
import 'package:front_end/widgets/modals/widgets/body_modal.dart';
import 'package:front_end/widgets/modals/widgets/footer_modal.dart';
import 'package:front_end/widgets/modals/widgets/header_model.dart';
import 'package:front_end/widgets/modals/widgets/text_body_modal.dart';

class ModalWarning extends StatelessWidget {
  const ModalWarning({
    Key? key,
    required this.onPressedNo,
    required this.onPressedYes,
  }) : super(key: key);

  final void Function()? onPressedYes;
  final void Function()? onPressedNo;

  @override
  Widget build(BuildContext context) {
    return ModalCustomApp(
      header: HeaderModal(
        title: context.T.titleWarningModal,
        icon: IconsApp.warning,
        colorIcon: ColorsApp.warning,
      ),
      body: BodyModal(
        child: TextBodyModal(
          text: context.T.msgWarningModal,
        ),
      ),
      footer: FooterModal(
        spacing: 15,
        children: [
          ButtonModal(
            title: context.T.labelNo,
            color: ColorsApp.error,
            onPressed: onPressedNo,
          ),
          ButtonModal(
            title: context.T.labelYes,
            color: ColorsApp.confirmButton,
            onPressed: onPressedYes,
          ),
        ],
      ),
    );
  }
}
