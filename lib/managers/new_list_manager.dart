import 'package:flutter/cupertino.dart';
import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/notifiers/news_api_selection_notifier.dart';
import 'package:flutter_internet_reader/notifiers/news_list_notifier.dart';
import 'package:provider/provider.dart';

class NewsListManager {
  final BuildContext context;

  NewsListManager(this.context);

  Future<List<News>> getNewsList() async {
    final news = await _fetchNewsList();

    Provider.of<NewsListNotifier>(context, listen: false).setNewsState(true);

    return news;
  }

  Future refreshNews() async {
    Provider.of<NewsListNotifier>(context, listen: false).setNewsState(false);
  }

  Future<List<News>> _fetchNewsList() async {
    var list = <News>[];

    final apisList = Provider.of<NewsApiSelectionNotifier>(context, listen: false).apisList;
    for (var item in apisList) {
      list.addAll(await item.provider.getNews());
    }

    return list;
  }
}
