import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/providers/api_provider.dart';

class NYTimesApiProvider extends ApiProvider {
  final String url;

  NYTimesApiProvider(this.url);

  @override
  Future<List<News>> getNews() async {
    final response = await fetchNews(url);

    final Iterable articles = response['results'];

    return articles.map((x) => News.fromNYTimesNews(x)).toList();
  }
}
