// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';

class Resources {
  static void dowloadCsv({
    required String csvData,
    required String fileName,
  }) {
    html.AnchorElement()
      ..href =
          '${Uri.dataFromString(csvData, mimeType: 'text/csv', encoding: utf8)}'
      ..download = fileName
      ..style.display = 'none'
      ..click();
  }
}
