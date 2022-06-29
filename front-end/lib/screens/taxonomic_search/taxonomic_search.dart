import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:front_end/models/taxonomic_search/taxonomic.dart';
import 'package:front_end/providers/taxonomic.dart';
import 'package:front_end/utils/resources.dart';
import 'package:front_end/widgets/table/data_table_custom.dart';
import 'package:provider/provider.dart';
import 'package:front_end/utils/extensions.dart';

class TaxonomicSearch extends StatefulWidget {
  const TaxonomicSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<TaxonomicSearch> createState() => _TaxonomicSearchState();
}

class _TaxonomicSearchState extends State<TaxonomicSearch> {
  List<Taxonomic> taxonomics = [];
  final header = <List<String>>[
    [
      'id',
      'Nome pesquisado',
      'Nomes retornados',
      'Nome aceito/sinonimo',
      'Sinonimo de',
      'Base de dados (FDB/TPL)',
      'Família respectiva da base de dados',
      'Autor',
      'Encontrado',
    ],
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      setState(() {
        taxonomics = context.read<TaxonomicProvider>().taxonomics ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DataTableCustom(
        title: context.T.titleResultTaxonomicSearch,
        columns: header[0],
        rowsCells: taxonomics.map((taxonomic) {
          final synonymOf = taxonomic.synonymOf;

          final acceptedName = synonymOf.isNotNull
              ? (synonymOf!.isEmpty ? 'NOME_ACEITO' : 'SINONIMO')
              : null.toString();

          final List<String> cells = [
            taxonomic.id.toString(),
            taxonomic.searchedSpeciesName.toString(),
            taxonomic.returnedNames.toString(),
            acceptedName,
            taxonomic.synonymOf.toString(),
            taxonomic.database.toString(),
            taxonomic.respectiveFamily.toString(),
            taxonomic.autor.toString(),
            taxonomic.found.toString(),
          ];

          return cells;
        }).toList(),
        onPressed: () {
          var data = <List<String>>[
            [
              'id',
              'Nome pesquisado',
              'Nomes retornados',
              'Nome aceito/sinonimo',
              'Sinonimo de',
              'Base de dados (FDB/TPL)',
              'Família respectiva da base de dados',
              'Autor',
              'Encontrado'
            ],
          ];

          data.addAll(taxonomics.map<List<String>>(
            (taxonomic) {
              final synonymOf = taxonomic.synonymOf;

              final acceptedName = synonymOf.isNotNull
                  ? (synonymOf!.isEmpty ? 'NOME_ACEITO' : 'SINONIMO')
                  : null.toString();
              final taxonomicRow = [
                taxonomic.id.toString(),
                taxonomic.searchedSpeciesName.toString(),
                taxonomic.returnedNames.toString(),
                acceptedName,
                taxonomic.synonymOf.toString(),
                taxonomic.database.toString(),
                taxonomic.respectiveFamily.toString(),
                taxonomic.autor.toString(),
                taxonomic.found.toString(),
              ];
              return taxonomicRow;
            },
          ).toList());

          String csvData = const ListToCsvConverter().convert(data);

          Resources.dowloadCsv(
            csvData: csvData,
            fileName: 'taxonomic_search',
          );
        },
      ),
    );
  }
}
