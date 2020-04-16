import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/models/news.dart';
import 'package:http/http.dart' as http;

abstract class ApiProvider {
  @protected
  Future<Map<String, dynamic>> fetchNews(String url) async {
    var response = await http.get(url);

    return json.decode(response.body);
  }

  Future<List<News>> getNews();
}