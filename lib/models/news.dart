import 'package:flutter/material.dart';

class News {
  DateTime date;
  String title;
  String description;
  String imageUrl;
  String url;

  News(
      {@required this.url,
      this.title,
      @required this.description,
      this.date,
      this.imageUrl});

  News.fromGoogleNews(Map<String, dynamic> json)
      : date = DateTime.parse(json['publishedAt']),
        title = json['title'],
        description = json['description'],
        imageUrl = json['urlToImage'],
        url = json['url'];

  News.fromNYTimesNews(Map<String, dynamic> json)
      : date = DateTime.parse(json['created_date']),
        title = json['title'],
        description = json['abstract'],
        imageUrl = json['multimedia'][0]['url'],
        url = json['url'];

  News.fromNewsNews(Map<String, dynamic> json)
      : date = DateTime.parse(json['publishedAt']),
        title = json['title'],
        description = json['description'],
        imageUrl = json['urlToImage'],
        url = json['url'];

  News.fromCryptoNews(Map<String, dynamic> json)
      : date = DateTime.parse(json['publishedAt']),
        title = json['title'],
        description = json['description'],
        imageUrl = json['thumbnail'],
        url = json['url'];
}
