import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = const Text("第一個Flutter App");
    var hiFlutter = const Text(
      "Hi, Flutter.",
      style: TextStyle(fontSize: 30),
    );

    var appBody = Center(child: hiFlutter);

    var appBar = AppBar(
      title: appTitle,
    );

    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
      ),
    );

    return app;
  }
}
