import 'dart:convert';

class Taxonomic {
  Taxonomic({
    required this.id,
    required this.searchedSpeciesName,
    required this.returnedNames,
    required this.synonymOf,
    required this.database,
    required this.respectiveFamily,
    required this.autor,
    required this.found,
  });

  factory Taxonomic.fromMap(Map<String, dynamic> map) => Taxonomic(
        id: map['id'] as int?,
        searchedSpeciesName: map['searchedSpeciesName'] as String?,
        returnedNames: map['returnedNames'] as String?,
        synonymOf: map['synonymOf'] as String?,
        database: map['database'] as String,
        respectiveFamily: map['respectiveFamily'] as String?,
        autor: map['autor'] as String?,
        found: map['found'] as bool,
      );

  final int? id;
  final String? searchedSpeciesName;
  final String? returnedNames;
  final String? synonymOf;
  final String database;
  final String? respectiveFamily;
  final String? autor;
  final bool found;

  @override
  String toString() {
    return 'Taxonomic{id: $id, searchedSpeciesName: $searchedSpeciesName, returnedNames: $returnedNames, synonymOf: $synonymOf, database: $database, respectiveFamily: $respectiveFamily, autor: $autor, found: $found}';
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'searchedSpeciesName': searchedSpeciesName,
        'returnedNames': returnedNames,
        'synonymOf': synonymOf,
        'database': database,
        'respectiveFamily': respectiveFamily,
        'autor': autor,
        'found': found,
      };

  String toJson() => jsonEncode(toMap());
}
