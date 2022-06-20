import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/bloc/searchs/searchs_bloc.dart';
import 'package:front_end/utils/enums.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/buttons/button_search.dart';
import 'package:front_end/widgets/modals/modal_types/modal_error.dart';
import 'package:front_end/widgets/modals/modal_types/modal_file_imported.dart';
import 'package:front_end/widgets/modals/modal_types/modal_import_file.dart';
import 'package:front_end/widgets/modals/modal_types/modal_success.dart';
import 'package:front_end/widgets/modals/modal_types/modal_warning.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchsBloc>().stream.listen((state) {
      state.maybeWhen(
        initial: () {
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalImportFile(
                  onPressedImportFile: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.import(SearchType.taxonomic),
                        );
                    context.vRouter.pop();
                  },
                  onPressedCancel: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.alert(),
                        );
                    context.vRouter.pop();
                  },
                  onPressedOk: () {},
                );
              },
            ),
          );
        },
        imported: (file) {
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalFileImported(
                  onPressedImportFile: () {},
                  onPressedCancel: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.alert(),
                        );
                    context.vRouter.pop();
                  },
                  onPressedOk: () {
                    context.read<SearchsBloc>().add(
                          SearchsEvent.search(file),
                        );
                    context.vRouter.pop();
                  },
                );
              },
            ),
          );
        },
        loading: () {},
        success: (taxonomicList, fileName) {
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalSuccess(
                  onPressedBack: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.reset(),
                        );
                    context.vRouter.pop();
                  },
                  onPressedExportFile: () {
                    context.read<SearchsBloc>().add(
                          SearchsEvent.export(
                            taxonomicsList: taxonomicList,
                            fileName: fileName,
                          ),
                        );
                    context.vRouter.pop();
                  },
                );
              },
            ),
          );
        },
        warning: () {
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalWarning(
                  onPressedNo: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.init(),
                        );
                    context.vRouter.pop();
                  },
                  onPressedYes: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.reset(),
                        );
                    context.vRouter.pop();
                  },
                );
              },
            ),
          );
        },
        error: (err) {
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalError(
                  onPressedBack: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.init(),
                        );
                    context.vRouter.pop();
                  },
                  message: context.T.labelUnexpectedError,
                );
              },
            ),
          );
        },
        orElse: () {},
      );
    });
  }

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
              context.read<SearchsBloc>().add(
                    const SearchsEvent.init(),
                  );
            },
          ),
          ButtonSearch(
            title: context.T.labelButtonSearchOccurrence,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
