import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    ));

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _currentindex = 0;
  var url = "https://google.com";
  TextEditingController textEditingController = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  launchUrl() {
    setState(() {
      url = textEditingController.text;
      flutterWebviewPlugin.reloadUrl(url);
    });
  }

  tohome() {
    setState(() {
      url = "https://google.com";
      flutterWebviewPlugin.reloadUrl(url);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          textInputAction: TextInputAction.go,
          controller: textEditingController,
          cursorColor: Colors.black54,
          cursorWidth: 0.3,
          autocorrect: true,
          onSubmitted: (url) => launchUrl(),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter URL here",
              fillColor: Colors.white12,
              hoverColor: Colors.lightBlueAccent,
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.navigate_next), onPressed: () => launchUrl()),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                flutterWebviewPlugin.reload();
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        backgroundColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 90,
        items: [
          BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  flutterWebviewPlugin.goBack();
                },
              )),
          BottomNavigationBarItem(
            title: Text(""),
            icon: IconButton(
                icon: Icon(Icons.home),
                color: Colors.black,
                onPressed: () => tohome()),
          ),
          BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                color: Colors.black,
                onPressed: () {
                  flutterWebviewPlugin.goForward();
                },
              )),
        ],
      ),
      url: url,
      withZoom: true,
    );
  }
}
