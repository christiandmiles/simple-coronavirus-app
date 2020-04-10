import 'dart:convert';

List<HistoricalCases> historicalCasesFromJson(String str) => List<HistoricalCases>.from(json.decode(str).map((x) => HistoricalCases.fromJson(x)));

String historicalCasesToJson(List<HistoricalCases> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoricalCases {

    HistoricalCases({
        this.country,
        this.province,
        this.timeline,
    });

    factory HistoricalCases.fromJson(Map<String, dynamic> json) => HistoricalCases(
        country: json['country'],
        province: json['province'],
        timeline: Timeline.fromJson(json['timeline']),
    );

    String country;
    String province;
    Timeline timeline;

    Map<String, dynamic> toJson() => {
        'country': country,
        'province': province,
        'timeline': timeline.toJson(),
    };
}

class Timeline {

    Timeline({
        this.cases,
        this.deaths,
        this.recovered,
    });

    factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        cases: Map.from(json['cases']).map((k, v) => MapEntry<String, int>(k, v)),
        deaths: Map.from(json['deaths']).map((k, v) => MapEntry<String, int>(k, v)),
        recovered: Map.from(json['recovered']).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, int> cases;
    Map<String, int> deaths;
    Map<String, int> recovered;
    
    Map<String, dynamic> toJson() => {
        'cases': Map.from(cases).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'deaths': Map.from(deaths).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'recovered': Map.from(recovered).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
