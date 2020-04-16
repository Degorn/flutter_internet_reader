import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/infrastructure/news_apis.dart';

class NewsApiSelectionNotifier with ChangeNotifier {
  static const int minApiInstaces = 1;
  static const int maxApiInstaces = 3;

  List<NewsApiInstance> _instances = [NewsApiInstance.newsList.elementAt(0)];

  UnmodifiableListView<NewsApiInstance> get apisList =>
      UnmodifiableListView(_instances);

  void addInstance(NewsApiInstance instance) {
    if (_instances.length >= maxApiInstaces) {
      return;
    }

    _instances.add(instance);
    notifyListeners();
  }

  void removeInstane(NewsApiInstance instance) {
    if (_instances.length == minApiInstaces) {
      return;
    }

    _instances.remove(instance);
    notifyListeners();
  }
}
