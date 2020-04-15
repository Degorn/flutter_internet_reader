import 'package:flutter/cupertino.dart';

class NewsItemNotifier extends ChangeNotifier {
  bool isExpanded = false;

  void switchExpanded() {
    isExpanded = !isExpanded;

    notifyListeners();
  }
}