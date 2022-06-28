import 'package:flutter/material.dart';
import 'package:front_end/models/taxonomic_search/taxonomic.dart';

class TaxonomicProvider extends ChangeNotifier {
  List<Taxonomic>? _taxonomics;

  List<Taxonomic>? get taxonomics {
    return _taxonomics;
  }

  void setTaxonomics(List<Taxonomic>? newTaxonomics) {
    _taxonomics = newTaxonomics;

    notifyListeners();
  }
}
