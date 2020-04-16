import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage(this.url);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isPageLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            WebView(
              initialUrl: widget.url,
              onPageStarted: (_) {
                setState(() {
                  isPageLoading = true;
                });
              },
              onPageFinished: (_) {
                setState(() {
                  isPageLoading = false;
                });
              },
            ),
            if (isPageLoading)
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    );
  }
}
