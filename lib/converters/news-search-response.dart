// To parse this JSON data, do
//
//     final newsSearchResponse = newsSearchResponseFromJson(jsonString);

import 'dart:convert';

NewsSearchResponse newsSearchResponseFromJson(String str) =>
    NewsSearchResponse.fromJson(json.decode(str));

String newsSearchResponseToJson(NewsSearchResponse data) =>
    json.encode(data.toJson());

class NewsSearchResponse {

  NewsSearchResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsSearchResponse.fromJson(Map<String, dynamic> json) =>
      NewsSearchResponse(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: List<Article>.from(
            json['articles'].map((x) => Article.fromJson(x))),
      );

  String status;
  int totalResults;
  List<Article> articles;

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.parse(json['publishedAt']),
        content: json['content'],
      );

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Map<String, dynamic> toJson() => {
        'source': source.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt.toIso8601String(),
        'content': content,
      };
}

class Source {

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'],
        name: json['name'],
      );
      
  dynamic id;
  String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
