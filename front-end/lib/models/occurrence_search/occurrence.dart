import 'dart:convert';

class Occurrence {
  Occurrence({
    required this.scientificName,
    required this.database,
    required this.family,
    required this.country,
    required this.year,
    required this.month,
    required this.day,
    required this.lat,
    required this.long,
  });

  factory Occurrence.fromMap(Map<String, dynamic> map) => Occurrence(
        scientificName: map['scientificName'] as String?,
        database: map['baseDeDados'] as String?,
        family: map['family'] as String?,
        country: map['country'] as String?,
        year: map['year'] as String?,
        month: map['month'] as String?,
        day: map['day'] as String?,
        lat: map['lat'] as String?,
        long: map['long'] as String?,
      );

  final String? scientificName;
  final String? database;
  final String? family;
  final String? country;
  final String? year;
  final String? month;
  final String? day;
  final String? lat;
  final String? long;

  @override
  String toString() {
    return 'Occurrence{scientificName: $scientificName, database: $database, family: $family, country: $country, year: $year, month: $month, day: $day, lat: $lat, long: $long}';
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'scientificName': scientificName,
        'baseDeDados': database,
        'family': family,
        'country': country,
        'year': year,
        'month': month,
        'day': day,
        'lat': lat,
        'long': long,
      };

  String toJson() => jsonEncode(toMap());
}
