import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("GridView範例"),
    );

    final gridView = GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      physics: const BouncingScrollPhysics(),
      children: [
        Image.asset("assets/1.png"),
        Image.asset("assets/2.png"),
        Image.asset("assets/3.png"),
      ],
    );

    const items = <String>['第一項', '第二項', '第三項', '第四項', '第五項',
      '第六項', '第七項', '第八項', '第九項',];

    final gridView2 = GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      physics: const BouncingScrollPhysics(),
      children: List.generate(items.length, (index) {
        final widget = Container(
          child: Text(items[index], style: const TextStyle(fontSize: 20),),
          alignment: Alignment.center,
          color: Colors.black12,
        );
        return widget;
      }),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: gridView2,
    );

    return appHomePage;
  }
}
