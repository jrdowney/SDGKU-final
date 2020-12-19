import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController _webViewController;

  String url = "";
  double progress = 0;

  get inAppWebViewController => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fn Browser'),
          leading: GestureDetector(
            onTap: () {
              print("Help Button Clicked");
              Navigator.pushNamed(context, "/help");
            },
            child: Icon(
              Icons.help,
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print("Settings Button Clicked");
                    Navigator.pushNamed(context, "/settings");
                  },
                  child: Icon(
                    Icons.settings,
                    size: 26.0,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              // child: GestureDetector(
              //   onTap: () {},
              //   child: Icon(Icons.more_vert),
              // )
            ),
          ],
          backgroundColor: Colors.grey[700],
        ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              height: 42,
              child: Text(
                  "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: InAppWebView(
                  // initialUrl:
                  // "https://keycode.info/", // for testing key simulation
                  initialUrl: "https://sra.cn.ca",
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                          debuggingEnabled: true,
                          javaScriptCanOpenWindowsAutomatically: true),
                      android: AndroidInAppWebViewOptions(
                          supportMultipleWindows: true)),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  onCreateWindow: (controller, createWindowRequest) async {
                    _webViewController = controller;
                    setState(() {
                      controller.loadUrl(url: createWindowRequest.url);
                    });
                    return true;
                  }, // fixes popup issue
                  onConsoleMessage: (controller, consoleMessage) {
                    print(consoleMessage.message);
                  },
                  onLoadStart: (InAppWebViewController controller, String url) {
                    setState(() {
                      this.url = url;
                    });
                    print("onLoadStart popup $url");
                  },
                  onLoadStop:
                      (InAppWebViewController controller, String url) async {
                    setState(() {
                      this.url = url;
                    });
                    print("onLoadStop popup $url");

                    // inject javascript file from assets folder
                    await controller.injectJavascriptFileFromAsset(
                        assetFilePath: "web/common.js");
                    await controller.injectJavascriptFileFromUrl(
                        urlFile: "https://code.jquery.com/jquery-3.5.0.js");
                    // wait for jquery to be loaded
                    await Future.delayed(Duration(milliseconds: 1000));
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 112,);');
                        print("F1 button Clicked");
                      },
                      child: Text("F1")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 113,);');
                        print("F2 button Clicked");
                      },
                      child: Text("F2")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 114,);');
                        print("F3 button Clicked");
                      },
                      child: Text("F3")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 115,);');
                        print("F4 button Clicked");
                      },
                      child: Text("F4")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 116,);');
                        print("F5 button Clicked");
                      },
                      child: Text("F5")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 117,);');
                        print("F6 button Clicked");
                      },
                      child: Text("F6")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 118,);');
                        print("F7 button Clicked");
                      },
                      child: Text("F7")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 119,);');
                        print("F8 button Clicked");
                      },
                      child: Text("F8")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 120,);');
                        print("F9 button Clicked");
                      },
                      child: Text("F9")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 121,);');
                        print("F10 button Clicked");
                      },
                      child: Text("F10")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 122,);');
                        print("F11 button Clicked");
                      },
                      child: Text("F11")),
                  MaterialButton(
                      height: 5,
                      minWidth: 5,
                      onPressed: () async {
                        await _webViewController.evaluateJavascript(
                            source: 'KeyEvent.simulate(0, 123,);');
                        print("F12 button Clicked");
                      },
                      child: Text("F12")),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.goBack();
                    }
                  },
                ),
                RaisedButton(
                  child: Text("OK"),
                  onPressed: () async {
                    await _webViewController.evaluateJavascript(
                        source: 'KeyEvent.simulate(0, 13,);');

                    await _webViewController.evaluateJavascript(
                        source:
                            'document.getElementById("button_signIn").click()'); // will click if button id matches

                    print("OK button Clicked");
                  },
                ),
                RaisedButton(
                    child: Text('F3'),
                    onPressed: () async {
                      await _webViewController.evaluateJavascript(
                          source: 'KeyEvent.simulate(0, 114,);');

                      print("F3 button Clicked");
                    }),
                RaisedButton(
                  child: Text('F5'),
                  onPressed: () async {
                    String result3 = await _webViewController
                        .evaluateJavascript(source: "\$('body').html();");
                    print(result3);

                    // Inject JavaScript that will receive data back from Flutter
                  },
                ),
                RaisedButton(
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.reload();
                    }
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
