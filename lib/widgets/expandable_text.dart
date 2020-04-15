import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/notifiers/news_item_notifier.dart';
import 'package:provider/provider.dart';

const int maxTextLength = 110;

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText({this.text});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  bool get canExpand => widget.text.length > maxTextLength;
  String get currentText => isExpanded || widget.text.length <= maxTextLength
      ? widget.text
      : widget.text.substring(0, maxTextLength);
  int get maxLines => isExpanded ? 10 : 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsItemNotifier = Provider.of<NewsItemNotifier>(context);
    isExpanded = newsItemNotifier.isExpanded;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: buildDescription(),
        ),
        if (canExpand)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 36,
            child: SizedBox(
              child: buildExpandButton(newsItemNotifier),
            ),
          ),
      ],
    );
  }

  Widget buildDescription() {
    return Text(
      currentText,
      maxLines: maxLines,
      overflow: TextOverflow.fade,
      style: TextStyle(color: Colors.white70),
    );
  }

  Widget buildExpandButton(NewsItemNotifier newsItemNotifier) {
    return Container(
      child: IconButton(
        onPressed: () {
          newsItemNotifier.switchExpanded();
        },
        icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
        iconSize: 30,
        color: Colors.white70,
      ),
    );
  }
}
