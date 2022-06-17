import 'package:flutter/material.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/buttons/button_search.dart';
import 'package:front_end/widgets/modals/modal_types/modal_error.dart';
import 'package:front_end/widgets/modals/modal_types/modal_import_file.dart';
import 'package:front_end/widgets/modals/modal_types/modal_success.dart';
import 'package:front_end/widgets/modals/modal_types/modal_warning.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runSpacing: 30,
        spacing: 30,
        children: [
          ButtonSearch(
            title: context.T.labelButtonTaxonomicSearch,
            onPressed: () {
              Future.microtask(
                () => showGeneralDialog(
                  context: context,
                  pageBuilder: (BuildContext context, _, __) {
                    return ModalSuccess(
                      onPressedBack: () {
                        context.vRouter.pop();
                      },
                      onPressedExportFile: () {},
                    );
                  },
                ),
              );
            },
          ),
          ButtonSearch(
            title: context.T.labelButtonSearchOccurrence,
            onPressed: () {
              Future.microtask(
                () => showGeneralDialog(
                  context: context,
                  pageBuilder: (BuildContext context, _, __) {
                    return ModalImportFile(
                      onPressedImportFile: () {
                        context.vRouter.pop();
                        Future.microtask(
                          () => showGeneralDialog(
                            context: context,
                            pageBuilder: (BuildContext context, _, __) {
                              return ModalError(
                                onPressedBack: () {
                                  context.vRouter.pop();
                                },
                                message: context.T.msgErrorFileType,
                              );
                            },
                          ),
                        );
                      },
                      onPressedCancel: () {
                        Future.microtask(
                          () => showGeneralDialog(
                            context: context,
                            pageBuilder: (BuildContext context, _, __) {
                              return ModalWarning(
                                onPressedNo: () {
                                  context.vRouter.pop();
                                },
                                onPressedYes: () {
                                  context.vRouter.pop();
                                  context.vRouter.pop();
                                },
                              );
                            },
                          ),
                        );
                      },
                      onPressedOk: () {
                        context.vRouter.pop();
                        Future.microtask(
                          () => showGeneralDialog(
                            context: context,
                            pageBuilder: (BuildContext context, _, __) {
                              return ModalSuccess(
                                onPressedBack: () {
                                  context.vRouter.pop();
                                },
                                onPressedExportFile: () {
                                  context.vRouter.pop();
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
