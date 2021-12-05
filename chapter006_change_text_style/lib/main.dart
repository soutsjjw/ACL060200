import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTitle = const Text("第一個Flutter App");
    var hiFlutter = const Text(
      "Hi, Flutter.\n你真是太神奇了！",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );

    var appBody = Center(
      child: hiFlutter,
    );

    var appBar = AppBar(
      title: appTitle,
      backgroundColor: const Color(0xFFFF0000),
    );

    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
        backgroundColor: Colors.yellow,
      ),
    );

    return app;
  }
}
