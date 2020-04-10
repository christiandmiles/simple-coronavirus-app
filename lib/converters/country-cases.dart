import 'dart:convert';

List<CountryCases> countryCasesFromJson(String str) => List<CountryCases>.from(
    json.decode(str).map((x) => CountryCases.fromJson(x)));

String countryCasesToJson(List<CountryCases> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryCases {
  CountryCases({
    this.country,
    this.countryInfo,
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
  });

  factory CountryCases.fromJson(Map<String, dynamic> json) => CountryCases(
        country: json['country'],
        countryInfo: CountryInfo.fromJson(json['countryInfo']),
        updated: json['updated'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'] == null
            ? null
            : json['casesPerOneMillion'].toDouble(),
        deathsPerOneMillion: json['deathsPerOneMillion'] == null
            ? null
            : json['deathsPerOneMillion'].toDouble(),
        tests: json['tests'],
        testsPerOneMillion: json['testsPerOneMillion'],
      );

  String country;
  CountryInfo countryInfo;
  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;

  Map<String, dynamic> toJson() => {
        'country': country,
        'countryInfo': countryInfo.toJson(),
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
      };
}

class CountryInfo {

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json['_id'],
        iso2: json['iso2'],
        iso3: json['iso3'],
        lat: json['lat'].toDouble(),
        long: json['long'].toDouble(),
        flag: json['flag'],
      );
      
  int id;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'iso2': iso2,
        'iso3': iso3,
        'lat': lat,
        'long': long,
        'flag': flag,
      };
}
