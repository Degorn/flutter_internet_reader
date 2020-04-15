class Formatter {
  static String removeAllHtmlTags(String htmlText) {
    var exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
