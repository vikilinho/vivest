import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FinanceNews extends StatefulWidget {
  @override
  _FinanceNewsState createState() => _FinanceNewsState();
}

class _FinanceNewsState extends State<FinanceNews> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Latest Finance News "),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: "https://finance.yahoo.com/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
