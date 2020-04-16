import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/managers/new_list_manager.dart';
import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/notifiers/news_item_notifier.dart';
import 'package:flutter_internet_reader/notifiers/news_list_notifier.dart';
import 'package:flutter_internet_reader/pages/settings_page.dart';
import 'package:flutter_internet_reader/widgets/news_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsListManager newsManager;
  List<News> news = List<News>();

  @override
  Widget build(BuildContext context) {
    newsManager = NewsListManager(context);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBar(),
            buildNewsList(),
          ],
        ),
      ),
    );
  }

  Widget buildNewsList() {
    return Selector<NewsListNotifier, bool>(
      selector: (_, notifier) => notifier.isNewsFresh,
      builder: (_, notifier, __) => FutureBuilder(
        future: newsManager.getNewsList(),
        builder: (_, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildSliverList(snapshot);
          } else {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          }
        },
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
          icon: Icon(Icons.refresh),
          onPressed: newsManager.refreshNews,
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SettingsPage(),
              )),
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
}
