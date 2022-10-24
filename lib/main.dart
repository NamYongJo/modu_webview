import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';

void main(){
  runApp(const MainPage());
}

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  State <MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid){
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Builder(builder: (BuildContext context){
           return WebView(
              //initialUrl: 'http://10.0.2.2:8080', //로컬호스트
             initialUrl: 'https://modu.hoseo.dev',
             javascriptMode: JavascriptMode.unrestricted,
             gestureNavigationEnabled: true,
             onWebViewCreated: (WebViewController webViewController){
               _controller.complete(webViewController);
              },
            );
            },
          ),
        ),
      ),
    );
  }
}