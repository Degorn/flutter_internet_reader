import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/providers/api_provider.dart';

class GoogleApiProvider extends ApiProvider {
  final String url;

  GoogleApiProvider(this.url);

  @override
  Future<List<News>> getNews() async {
    final response = await fetchNews(url);

    final Iterable articles = response['articles'];

    return articles.map((x) => News.fromGoogleNews(x)).toList();
  }
}
