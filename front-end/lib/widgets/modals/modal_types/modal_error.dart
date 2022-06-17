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

class ModalError extends StatelessWidget {
  const ModalError({
    Key? key,
    required this.onPressedBack,
    required this.message,
  }) : super(key: key);

  final void Function()? onPressedBack;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ModalCustomApp(
      header: HeaderModal(
        title: context.T.titleErrorModal,
        icon: IconsApp.error,
        colorIcon: ColorsApp.error,
      ),
      body: BodyModal(
        child: TextBodyModal(
          text: message,
        ),
      ),
      footer: FooterModal(
        spacing: 15,
        children: [
          ButtonModal(
            title: context.T.labelBack,
            color: ColorsApp.error,
            onPressed: onPressedBack,
          ),
        ],
      ),
    );
  }
}
