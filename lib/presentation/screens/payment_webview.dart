import 'package:booking_app/config/api_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebview extends StatelessWidget {
  final String snapToken;

  PaymentWebview({required this.snapToken});

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
        controller: WebViewController()
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
          }, onNavigationRequest: (request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          }))
          ..loadRequest(Uri.parse(
              '$midtransUrl/$snapToken')));
  }
}
