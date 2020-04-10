import 'package:coronavirus_app/converters/historical-cases.dart';
import 'package:coronavirus_app/converters/state-cases.dart';
import 'package:coronavirus_app/converters/all-cases.dart';
import 'package:coronavirus_app/converters/country-cases.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class NovelCovid {
  
  Future<List<StateCases>> getStates() async {
    final response = await http.get('https://corona.lmao.ninja/states');
    return stateCasesFromJson(response.body);
  }

  Future<Map<String, double>> getAll() async {
    final response = await http.get('https://corona.lmao.ninja/all');
    return allCasesFromJson(response.body);
  }
  
  Future<List<CountryCases>> getCountries() async {
    final response = await http.get('https://corona.lmao.ninja/countries?sort=country');
    return countryCasesFromJson(response.body);
  }
  
  Future<CountryCases> getCountry(String country) async {
    final response = await http.get('https://corona.lmao.ninja/countries/$country');
    return CountryCases.fromJson(json.decode(response.body));
  }
  
  static Future<List<HistoricalCases>> getHistorical() async {
    final response = await http.get('https://corona.lmao.ninja/v2/historical');
    return historicalCasesFromJson(response.body);
  }
  
}