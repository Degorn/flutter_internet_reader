import 'package:flutter/material.dart';

class NewsListNotifier extends ChangeNotifier {
  bool isNewsFresh = false;

  void setNewsState(bool state) {
    isNewsFresh = state;

    notifyListeners();
  }
}