import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = const Text("Flutter App");

    var text = const Text(
      "Stack 可以讓物件重疊",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );

    final img = Image.asset("assets/red_circle.png");

    var appBody = Container(
      child: Stack(
        children: [
          img,
          // text,
          Positioned(top: 30, child: text),
        ],
        alignment: Alignment.center,
      ),
      alignment: Alignment.topCenter,
    );

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
