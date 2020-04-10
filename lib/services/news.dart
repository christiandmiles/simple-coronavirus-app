import 'package:coronavirus_app/converters/news-search-response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class News {
  final _apiKey = '6457796e25d4433099fcc0e7b7817067';

  Future<List<Article>> getLatest(
      {int numResults = 5, String stateName = ''}) async {
    final uri = Uri.https('newsapi.org', '/v2/everything', {
      'q': 'COVID +"$stateName"',
      'sortBy': 'publishedAt',
      'apiKey': _apiKey,
      'pageSize': numResults.toString(),
      'page': '1',
      'language': 'en'
    });
    final response = await http.get(uri);
    final result = newsSearchResponseFromJson(response.body);
    return result.articles;
  }
}
