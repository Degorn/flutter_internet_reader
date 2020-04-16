import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/infrastructure/news_apis.dart';
import 'package:flutter_internet_reader/widgets/settings_api_list_tile.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Colors.black87,
        ),
        body: buildSettingsLayout(context),
      ),
    );
  }

  Widget buildSettingsLayout(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Select from 1 to 3 news sources:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return SettingApiListTile(
                  NewsApiInstance.newsList.elementAt(index));
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: NewsApiInstance.newsList.length,
          ),
        ),
      ],
    );
  }
}
