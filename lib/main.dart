import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/notifiers/news_api_selection_notifier.dart';
import 'package:flutter_internet_reader/notifiers/news_list_notifier.dart';
import 'package:flutter_internet_reader/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsListNotifier()),
          ChangeNotifierProvider(
            create: (_) => NewsApiSelectionNotifier(),
          )
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
