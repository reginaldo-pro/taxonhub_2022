import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class MyData extends DataTableSource {
  late List<DataRow> rowsCells;

  MyData({
    required this.data,
  }) {
    rowsCells = data.map((cells) {
      return DataRow(
        color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          final int index = data.indexOf(cells);
          if (index % 2 == 0) {
            return ColorsApp.basilSmash.withOpacity(0.3);
          }
          return null;
        }),
        cells: cells.map(
          (cell) {
            return DataCell(
              Text(cell),
            );
          },
        ).toList(),
      );
    }).toList();
  }

  final List<List<String>> data;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return rowsCells[index];
  }
}
