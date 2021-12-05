import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = const Text("第一個Flutter App");

    var text1 = Container(
      child: const Text("物件1", style: TextStyle(fontSize: 20)),
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
    );
    var text2 = Container(
      child: const Text("物件2", style: TextStyle(fontSize: 20)),
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
    );
    var text3 = Container(
      child: const Text("物件3", style: TextStyle(fontSize: 20)),
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
    );

    var appBody = Container(
      child: Row(
        children: [text1, text2, text3],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      margin: const EdgeInsets.all(10),
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
