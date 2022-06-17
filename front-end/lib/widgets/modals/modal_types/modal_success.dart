import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/icons/icons.dart';
import 'package:front_end/widgets/buttons/button_modal.dart';
import 'package:front_end/widgets/modals/modal.dart';
import 'package:front_end/widgets/modals/widgets/body_modal.dart';
import 'package:front_end/widgets/modals/widgets/footer_modal.dart';
import 'package:front_end/widgets/modals/widgets/header_model.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/modals/widgets/text_body_modal.dart';

class ModalSuccess extends StatelessWidget {
  const ModalSuccess({
    Key? key,
    required this.onPressedBack,
    required this.onPressedExportFile,
  }) : super(key: key);

  final void Function()? onPressedBack;
  final void Function()? onPressedExportFile;

  @override
  Widget build(BuildContext context) {
    return ModalCustomApp(
      header: HeaderModal(
        title: context.T.titleSuccessModal,
        icon: IconsApp.success,
        colorIcon: ColorsApp.success,
      ),
      body: BodyModal(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBodyModal(
              text: context.T.msgSuccessModal,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonModal(
              title: context.T.titleSuccessModal,
              iconData: IconsApp.download,
              color: ColorsApp.fileButton,
              onPressed: onPressedExportFile,
            ),
          ],
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
