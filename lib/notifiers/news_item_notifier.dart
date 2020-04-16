import 'package:flutter/material.dart';

class NewsItemNotifier extends ChangeNotifier {
  bool isExpanded = false;

  void switchExpanded() {
    isExpanded = !isExpanded;

    notifyListeners();
  }
}