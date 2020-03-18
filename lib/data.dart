import 'dart:io';

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class CovidLocation {
  CovidLocation(
      {this.lat,
      this.lng,
      this.state,
      this.country,
      this.cases,
      this.totalCases,
      this.mostRecentDate});

  factory CovidLocation.fromCsvRow(List<dynamic> row, List<dynamic> headers) {
    var cases = <String, int>{};
    var totalCases = 0;
    var mostRecentDate = '';
    for (var i = 4; i < headers.length; i++) {
      cases[headers[i]] = row[i].toInt();
      totalCases += row[i].toInt();
      mostRecentDate = headers[i];
    }
    return CovidLocation(
        country: row[1].toString(),
        state: row[0].toString(),
        lat: row[2].toDouble(),
        lng: row[3].toDouble(),
        cases: cases,
        totalCases: totalCases,
        mostRecentDate: mostRecentDate);
  }

  final double lat;
  final double lng;
  final String state;
  final String country;
  final Map<String, int> cases;
  final int totalCases;
  final String mostRecentDate;
}

Future<List<CovidLocation>> getConfirmedCases() async {
  const csvUrl =
      'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv';

  final response = await http.get(csvUrl);
  if (response.statusCode == 200) {
    final rows = CsvToListConverter().convert(response.body);
    final headers = rows[0];
    var covidLocations = <CovidLocation>[];
    for (var i = 1; i < rows.length; i++) {
      covidLocations.add(CovidLocation.fromCsvRow(rows[i], headers));
    }
    return covidLocations;
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(csvUrl));
  }
}
