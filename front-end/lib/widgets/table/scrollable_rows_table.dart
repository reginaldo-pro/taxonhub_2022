import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:front_end/widgets/table/my_data.dart';
import 'package:front_end/widgets/table/title_header_table.dart';

class ScrollableRowsTable extends StatefulWidget {
  const ScrollableRowsTable({
    Key? key,
    required this.columns,
    required this.rowsCells,
    required this.maxHeight,
    required this.maxWidth,
  }) : super(key: key);

  final List<String> columns;
  final List<List<String>> rowsCells;
  final double maxHeight;
  final double maxWidth;

  @override
  State<ScrollableRowsTable> createState() => _ScrollableRowsTableState();
}

class _ScrollableRowsTableState extends State<ScrollableRowsTable> {
  int rowsPerPage = 1;

  void getRowsPerPage() {
    if (widget.rowsCells.isEmpty) return;

    int rows = (widget.maxHeight ~/ 56.0) - 1;

    if (rows <= 1) return;

    setState(() {
      rowsPerPage = rows;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      getRowsPerPage();
    });
    return PaginatedDataTable(
      dragStartBehavior: DragStartBehavior.start,
      columns: widget.columns.map((column) {
        return DataColumn(
          label: TitleHeaderTable(
            title: column,
          ),
          numeric: true,
        );
      }).toList(),
      source: MyData(
        data: widget.rowsCells,
      ),
      columnSpacing: widget.maxWidth /
          (widget.columns.length.compareTo(0) == 0 ? 1 : widget.columns.length),
      horizontalMargin: 10,
      rowsPerPage: rowsPerPage,
      showCheckboxColumn: false,
    );
  }
}
