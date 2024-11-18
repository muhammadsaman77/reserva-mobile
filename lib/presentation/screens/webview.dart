import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(NavigationDelegate(onProgress: (progress) {
    print('WebView is loading (progress : $progress)');
  }, onPageStarted: (String url) {
    print('Page started loading: $url');
  }, onPageFinished: (String url) {
    print('Page finished loading: $url');
  }, onHttpError: (error) {
    print("");
  }, onWebResourceError: (error) {
    print("");
  },
    onNavigationRequest: (request) {
      if (request.url.startsWith('https://www.youtube.com/')) {
        return NavigationDecision.prevent;
      }
      return NavigationDecision.navigate;
    }
  ))..loadRequest(Uri.parse('https://flutter.dev'));

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView'),),
      body: WebViewWidget(controller: controller),
    );
  }
}
