import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTitle = const Text("第一個Flutter App");

    var appBody = Center(
      // child: Image.asset("assets/flutter.png"),
      child: Image.network(
          "https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
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
