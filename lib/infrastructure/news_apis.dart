import 'package:flutter_internet_reader/providers/api_provider.dart';
import 'package:flutter_internet_reader/providers/crypto_news_api_provider.dart';
import 'package:flutter_internet_reader/providers/googl_api_provider.dart';
import 'package:flutter_internet_reader/providers/news_api_provider.dart';
import 'package:flutter_internet_reader/providers/nytimes_api_provider.dart';

const googleApiUrl =
    'http://newsapi.org/v2/top-headlines?sources=google-news&apiKey=3827688716334f019bbc0e3282b218d5';

const nyTimesApiUrl =
    'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=h6nLDgnQMMKglsFQpyF3dpQx04fXgcUL';

const newsApiUrl =
    'http://newsapi.org/v2/top-headlines?country=ca&apiKey=3827688716334f019bbc0e3282b218d5';

const cryptoApiUrl =
    'https://cryptocontrol.io/api/v1/public/news?key=c1ba0b2ba409f88bf666448c7b77f795';

class NewsApiInstance {
  static List<NewsApiInstance> newsList = [
    NewsApiInstance(
        GoogleApiProvider(googleApiUrl), 'Google News', googleApiUrl),
    NewsApiInstance(
        NYTimesApiProvider(nyTimesApiUrl), 'New York Times', nyTimesApiUrl),
    NewsApiInstance(NewsApiProvider(newsApiUrl), 'News', newsApiUrl),
    NewsApiInstance(CryptoNewsApiProvider(cryptoApiUrl), 'Crypto News', cryptoApiUrl),
  ];

  final ApiProvider provider;
  final String name;
  final String url;

  NewsApiInstance(this.provider, this.name, this.url);
}
