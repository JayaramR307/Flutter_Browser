import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url="https://google.com";
  TextEditingController textEditingController=TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin=FlutterWebviewPlugin();
  launchUrl()
  {
      setState(() {
        url=textEditingController.text;
        flutterWebviewPlugin.reloadUrl(url);
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs)
    {
      print(wvs.type);
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title:TextField(
          autofocus: false,
          textInputAction: TextInputAction.go,
          controller: textEditingController,
          cursorColor: Colors.white,
          cursorWidth: 0.3,
          onSubmitted: (url)=>launchUrl(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter URL here",
            hintStyle: TextStyle(color: Colors.white)
        ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.navigate_next), onPressed: ()=>launchUrl())
        ],
      ),
      url:url,
      withZoom: true,
    );
  }
}

