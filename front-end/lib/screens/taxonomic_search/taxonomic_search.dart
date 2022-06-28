import 'package:flutter/material.dart';
import 'package:front_end/models/occurrence_search/occurrence.dart';
import 'package:front_end/models/taxonomic_search/taxonomic.dart';
import 'package:front_end/providers/taxonomic.dart';
import 'package:provider/provider.dart';

class TaxonomicSearch extends StatefulWidget {
  const TaxonomicSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<TaxonomicSearch> createState() => _TaxonomicSearchState();
}

class _TaxonomicSearchState extends State<TaxonomicSearch> {
  List<Taxonomic> taxonomics = [];

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
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.white,
            height: 600,
            width: 1600,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      'id',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Nome pesquisado',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Nomes retornados',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Nome aceito/sinonimo',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Sinonimo de',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Base de dados (FDB/TPL)',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Família respectiva da base de dados',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Autor',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Encontrado',
                      overflow: TextOverflow.ellipsis,
                    ),
                    numeric: true,
                  ),
                ],
                rows: taxonomics.map((taxonomic) {
                  return DataRow(
                    cells: [
                      DataCell(Text(taxonomic.id.toString())),
                      DataCell(Text(taxonomic.searchedSpeciesName.toString())),
                      DataCell(Text(taxonomic.returnedNames.toString())),
                      DataCell(Text(null.toString())),
                      DataCell(Text(taxonomic.synonymOf.toString())),
                      DataCell(Text(taxonomic.database.toString())),
                      DataCell(Text(taxonomic.respectiveFamily.toString())),
                      DataCell(Text(taxonomic.autor.toString())),
                      DataCell(Text(taxonomic.found.toString())),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
