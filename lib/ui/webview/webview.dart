import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String url;

  const WebviewScreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController controller;
  late SharedPreferenceHelper _sharedPreferenceHelper;

  String? authWebview = '';
  String? perisit = '';

  @override
  void initState() {
    super.initState();
    _sharedPreferenceHelper =
        SharedPreferenceHelper(getIt<SharedPreferences>());
    firstLoad();
  }

  void firstLoad() async {
    var authWebviewValue = await _sharedPreferenceHelper.authWebview;
    var persistRootValue = await _sharedPreferenceHelper.persistRoot;
    setState(() {
      authWebview = authWebviewValue;
      perisit = persistRootValue;
    });
  }

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
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageStarted: (url) {
          if (authWebview!.isNotEmpty && perisit!.isNotEmpty) {
            controller.runJavascript(
                "localStorage.setItem('auth',JSON.stringify($authWebview));localStorage.setItem('persist:root',JSON.stringify($perisit))");
            controller
                .runJavascript("console.log(JSON.stringify(localStorage))");
          }

          print(perisit);
        },
        onPageFinished: (url) {
          controller.runJavascript(
              "document.getElementById('dashboard-header').style.display = 'none'");
          controller.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains("identity/sign-in")) {
            //You can do anything
            Navigator.of(context).pushNamed(Routes.login);
            //Prevent that url works
            return NavigationDecision.prevent;
          }
          //Any other url works
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
