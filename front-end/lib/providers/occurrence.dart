import 'package:flutter/material.dart';
import 'package:front_end/models/occurrence_search/occurrence.dart';

class OcurrenceProvider extends ChangeNotifier {
  List<Occurrence>? _occurences;

  List<Occurrence>? get occurences {
    return _occurences;
  }

  void setOccurences(List<Occurrence>? newOccurrences) {
    _occurences = newOccurrences;

    notifyListeners();
  }
}
