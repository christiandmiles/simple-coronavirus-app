import 'dart:convert';

List<StateCases> stateCasesFromJson(String str) =>
    List<StateCases>.from(json.decode(str).map((x) => StateCases.fromJson(x)));

String stateCasesToJson(List<StateCases> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateCases {

  StateCases({
    this.state,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.active,
    this.tests,
    this.testsPerOneMillion,
  });

  factory StateCases.fromJson(Map<String, dynamic> json) => StateCases(
        state: json['state'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        active: json['active'],
        tests: json['tests'],
        testsPerOneMillion: json['testsPerOneMillion'],
      );

  String state;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int active;
  int tests;
  int testsPerOneMillion;

  Map<String, dynamic> toJson() => {
        'state': state,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'active': active,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
      };
}
