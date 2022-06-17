import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/icons/icons.dart';
import 'package:front_end/widgets/buttons/button_modal.dart';
import 'package:front_end/widgets/modals/modal.dart';
import 'package:front_end/widgets/modals/widgets/body_modal.dart';
import 'package:front_end/widgets/modals/widgets/footer_modal.dart';
import 'package:front_end/widgets/modals/widgets/header_model.dart';
import 'package:front_end/utils/extensions.dart';

class ModalImportFile extends StatelessWidget {
  const ModalImportFile({
    Key? key,
    required this.onPressedOk,
    required this.onPressedCancel,
    required this.onPressedImportFile,
  }) : super(key: key);

  final void Function()? onPressedOk;
  final void Function()? onPressedCancel;
  final void Function()? onPressedImportFile;

  @override
  Widget build(BuildContext context) {
    return ModalCustomApp(
      header: HeaderModal(
        title: context.T.titleImportFileModal,
      ),
      body: BodyModal(
        child: ButtonModal(
          title: context.T.titleImportFileModal,
          iconData: IconsApp.uploud,
          color: ColorsApp.fileButton,
          onPressed: onPressedImportFile,
        ),
      ),
      footer: FooterModal(
        spacing: 15,
        children: [
          ButtonModal(
            title: context.T.labelCancel,
            color: ColorsApp.error,
            onPressed: onPressedCancel,
          ),
          ButtonModal(
            title: context.T.labelOK,
            color: ColorsApp.confirmButton,
            onPressed: onPressedOk,
          ),
        ],
      ),
    );
  }
}
