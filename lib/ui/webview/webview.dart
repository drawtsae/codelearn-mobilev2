import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String url;

  const WebviewScreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios_outlined),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(0, 0, 0, 0), // <-- Button color
              // <-- Splash color
            ),
          ),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageFinished: (url) {
          controller.runJavascript(
              "document.getElementById('dashboard-header').style.display = 'none'");
          controller.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
        },
      ),
    );
  }
}
