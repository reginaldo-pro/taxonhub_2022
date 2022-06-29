import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/occurrence_search/occurrence.dart';
import 'package:front_end/providers/occurrence.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:front_end/utils/resources.dart';
import 'package:front_end/widgets/table/app_bar_search_custom.dart';
import 'package:front_end/widgets/table/data_table_custom.dart';
import 'package:provider/provider.dart';

class OccurrencesSearch extends StatefulWidget {
  const OccurrencesSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<OccurrencesSearch> createState() => _OccurrencesSearchState();
}

class _OccurrencesSearchState extends State<OccurrencesSearch> {
  List<Occurrence> occurences = [];
  final header = <List<String>>[
    [
      'Scientific Name',
      'Database',
      'Family',
      'Country',
      'Year',
      'Month',
      'Day',
      'Lat',
      'Long',
    ],
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      setState(() {
        occurences = context.read<OcurrenceProvider>().occurences ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSearchCustom(),
      backgroundColor: Colors.transparent,
      body: DataTableCustom(
        title: context.T.titleResultSearchOccurrence,
        columns: header[0],
        rowsCells: occurences.map((occurence) {
          final List<String> cells = [
            occurence.scientificName.toString(),
            occurence.database.toString(),
            occurence.family.toString(),
            occurence.country.toString(),
            occurence.year.toString(),
            occurence.month.toString(),
            occurence.day.toString(),
            occurence.lat.toString(),
            occurence.long.toString(),
          ];

          return cells;
        }).toList(),
        onPressed: () {
          var data = header;

          data.addAll(occurences.map<List<String>>(
            (item) {
              final occurrenceRow = [
                item.scientificName.toString(),
                item.database.toString(),
                item.family.toString(),
                item.country.toString(),
                item.year.toString(),
                item.month.toString(),
                item.day.toString(),
                item.lat.toString(),
                item.long.toString(),
              ];
              return occurrenceRow;
            },
          ).toList());

          String csvData = const ListToCsvConverter().convert(data);

          Resources.dowloadCsv(
            csvData: csvData,
            fileName: 'occurrence_search',
          );
        },
      ),
    );
  }
}
