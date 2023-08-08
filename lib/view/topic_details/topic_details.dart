
import 'dart:async';

import 'package:anywheretask/res/colors.dart';
import 'package:anywheretask/res/styles.dart';
import 'package:anywheretask/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TopicWebViewScreen extends StatelessWidget {

  static const routeName = '/topic_details';

  final String selectedUrl;


  TopicWebViewScreen({

    required this.selectedUrl,
  });



  @override
  Widget build(BuildContext context) {

    //final userProvider = context.watch<UserViewModel>();


    final _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // print the loading progress to the console
            // you can use this value to show a progress bar if you want
            debugPrint("Loading: $progress%");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(selectedUrl));

    return Scaffold(
      appBar: CustomAppBar(
        title: "Topic Details",
      ),

      body:  WebViewWidget(
        controller: _controller,
      )
    );
  }
}
