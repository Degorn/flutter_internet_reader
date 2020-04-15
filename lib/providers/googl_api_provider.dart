import 'package:flutter_internet_reader/providers/api_provider.dart';

const url =
    'http://newsapi.org/v2/top-headlines?sources=google-news&apiKey=3827688716334f019bbc0e3282b218d5';

class GoogleApiProvider extends ApiProvider {
  static Future getNews() => ApiProvider.getNews(url);
}
