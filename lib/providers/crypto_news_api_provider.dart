import 'dart:convert';

import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class CryptoNewsApiProvider extends ApiProvider {
  final String url;

  CryptoNewsApiProvider(this.url);

  @override
  Future<List<News>> getNews() async {
    var response = await http.get(url);

    final Iterable articles = json.decode(response.body);

    return articles.map((x) => News.fromCryptoNews(x)).toList();
  }
}
