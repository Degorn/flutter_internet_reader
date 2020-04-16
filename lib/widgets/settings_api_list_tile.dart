import 'package:flutter/material.dart';
import 'package:flutter_internet_reader/infrastructure/news_apis.dart';
import 'package:flutter_internet_reader/notifiers/news_api_selection_notifier.dart';
import 'package:provider/provider.dart';

class SettingApiListTile extends StatefulWidget {
  final NewsApiInstance apiInstance;

  SettingApiListTile(this.apiInstance);

  @override
  _SettingApiListTileState createState() => _SettingApiListTileState();
}

class _SettingApiListTileState extends State<SettingApiListTile> {
  @override
  Widget build(BuildContext context) {
    final newsApiSelectionNotifier =
        Provider.of<NewsApiSelectionNotifier>(context);
    final isChecked =
        newsApiSelectionNotifier.apisList.contains(widget.apiInstance);

    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) {
        if (isChecked) {
          newsApiSelectionNotifier.removeInstane(widget.apiInstance);
        } else {
          newsApiSelectionNotifier.addInstance(widget.apiInstance);
        }
      },
      title: Text(widget.apiInstance.name),
    );
  }
}
