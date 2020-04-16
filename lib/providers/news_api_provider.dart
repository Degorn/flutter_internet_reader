import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/providers/api_provider.dart';

class NewsApiProvider extends ApiProvider {
  final String url;

  NewsApiProvider(this.url);

  @override
  Future<List<News>> getNews() async {
    final response = await fetchNews(url);

    final Iterable articles = response['articles'];

    return articles.map((x) => News.fromNewsNews(x)).toList();
  }
}
