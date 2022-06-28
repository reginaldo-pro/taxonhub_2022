import 'package:flutter/material.dart';
import 'package:front_end/models/occurrence_search/occurrence.dart';
import 'package:front_end/providers/occurrence.dart';
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
    return Container();
  }
}
