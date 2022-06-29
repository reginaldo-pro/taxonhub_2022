import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';
import 'package:front_end/icons/icons.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/widgets/buttons/button_modal.dart';
import 'package:front_end/widgets/table/scrollable_rows_table.dart';
import 'package:front_end/widgets/table/title_table.dart';

class DataTableCustom extends StatelessWidget {
  const DataTableCustom({
    Key? key,
    required this.title,
    required this.columns,
    required this.rowsCells,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final List<String> columns;
  final List<List<String>> rowsCells;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: ColorsApp.backgroundDataTable,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 150,
          bottom: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTable(
              title: title,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 30,
                ),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Center(
                      child: SingleChildScrollView(
                        child: ScrollableRowsTable(
                          columns: columns,
                          rowsCells: rowsCells,
                          maxHeight: constraint.maxHeight,
                          maxWidth: constraint.maxWidth,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 30,
                bottom: 20,
              ),
              alignment: Alignment.bottomRight,
              child: ButtonModal(
                title: context.T.titleSuccessModal,
                iconData: IconsApp.download,
                color: ColorsApp.fileButton,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
