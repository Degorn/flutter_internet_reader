import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  @protected
  static Future getNews(String url) {
    return http.get(url);
  }
}