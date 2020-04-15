import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/notifiers/news_item_notifier.dart';
import 'package:flutter_internet_reader/providers/googl_api_provider.dart';
import 'package:flutter_internet_reader/widgets/news_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getNewsList(),
          builder: (_, AsyncSnapshot<List<News>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomScrollView(
                slivers: <Widget>[
                  buildSliverAppBar(),
                  buildSliverList(snapshot),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.black87,
      floating: true,
      title: Text('News'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildSliverList(AsyncSnapshot<List<News>> snapshot) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          final news = snapshot.data.elementAt(index);

          return ChangeNotifierProvider(
            create: (_) => NewsItemNotifier(),
            child: NewsItem(news: news),
          );
        },
        childCount: snapshot.data.length,
      ),
    );
  }

  Future<List<News>> getNewsList() async {
    final response = await GoogleApiProvider.getNews();

    final Iterable articles = json.decode(response.body)['articles'];

    List<News> news = articles.map((x) => News.fromGoogleNews(x)).toList();

    return news;
  }
}
