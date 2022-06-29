import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/bloc/searchs/searchs_bloc.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/providers/occurrence.dart';
import 'package:front_end/providers/taxonomic.dart';
import 'package:front_end/routes/routes.dart';
import 'package:front_end/utils/enums.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/buttons/button_search.dart';
import 'package:front_end/widgets/modals/modal_types/modal_error.dart';
import 'package:front_end/widgets/modals/modal_types/modal_file_imported.dart';
import 'package:front_end/widgets/modals/modal_types/modal_import_file.dart';
import 'package:front_end/widgets/modals/modal_types/modal_success.dart';
import 'package:front_end/widgets/modals/modal_types/modal_warning.dart';
import 'package:vrouter/vrouter.dart';
import 'package:front_end/utils/errors/capture_default_errors.dart';

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
          context.vRouter.pop();
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalImportFile(
                  onPressedImportFile: () {
                    context.read<SearchsBloc>().add(
                          const SearchsEvent.import(),
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
        empty: () {
          context.vRouter.pop();
        },
        imported: (file) {
          context.vRouter.pop();
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
        loading: () {
          context.vRouter.pop();
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return const Scaffold(
                  backgroundColor: ColorsApp.blursModalBackground,
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          );
        },
        success: (occurrenceList, taxonomicList, searchType, fileName) {
          context.vRouter.pop();
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

                    switch (searchType) {
                      case SearchType.occurrence:
                        context
                            .read<OcurrenceProvider>()
                            .setOccurences(occurrenceList);
                        context.vRouter.to(
                          RoutesApp.occurrencesSearch,
                        );
                        break;
                      case SearchType.taxonomic:
                        context
                            .read<TaxonomicProvider>()
                            .setTaxonomics(taxonomicList);
                        context.vRouter.to(
                          RoutesApp.taxonomicSearch,
                        );
                        break;
                    }
                  },
                  onPressedExportFile: () {
                    context.read<SearchsBloc>().add(
                          SearchsEvent.export(
                            taxonomicsList: taxonomicList,
                            occurrenciesList: occurrenceList,
                            fileName: fileName,
                          ),
                        );
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
        warning: () {
          context.vRouter.pop();
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalWarning(
                  onPressedNo: () {
                    final searchType = context.read<SearchsBloc>().searchType!;
                    context.read<SearchsBloc>().add(
                          SearchsEvent.init(searchType),
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
          context.vRouter.pop();
          Future.microtask(
            () => showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, _, __) {
                return ModalError(
                  onPressedBack: () {
                    final searchType = context.read<SearchsBloc>().searchType!;
                    context.read<SearchsBloc>().add(
                          SearchsEvent.init(searchType),
                        );
                    context.vRouter.pop();
                  },
                  message: err.defaultErrortoString(context),
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
                    const SearchsEvent.init(SearchType.taxonomic),
                  );
            },
          ),
          ButtonSearch(
            title: context.T.labelButtonSearchOccurrence,
            onPressed: () {
              context.read<SearchsBloc>().add(
                    const SearchsEvent.init(SearchType.occurrence),
                  );
            },
          ),
        ],
      ),
    );
  }
}
