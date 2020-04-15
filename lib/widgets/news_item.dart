import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/managers/formatter.dart';
import 'package:flutter_internet_reader/models/news.dart';
import 'package:flutter_internet_reader/notifiers/news_item_notifier.dart';
import 'package:flutter_internet_reader/pages/web_view_page.dart';
import 'package:flutter_internet_reader/widgets/expandable_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WebViewPage(news.url),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          buildCard(context),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context) {
    final newsItemNotifier = Provider.of<NewsItemNotifier>(context);
    final double cardHeight = newsItemNotifier.isExpanded ? 260 : 180;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: cardHeight,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: buildBackgroundImage(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildInfo(cardHeight),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: buildDate(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackgroundImage() {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: news.imageUrl,
      fit: BoxFit.fitWidth,
    );
  }

  Widget buildInfo(double cardHeight) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: cardHeight,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              Colors.black.withAlpha(0),
              Colors.black45,
            ],
            stops: <double>[
              0.0,
              0.4,
            ],
          ),
        ),
        child: ExpandableText(
          text: Formatter.removeAllHtmlTags(news.description),
        ),
      ),
    );
  }

  Widget buildDate() {
    return Container(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
        child: Text(
          DateFormat('yyyy-MM-dd – kk:mm').format(news.date),
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
