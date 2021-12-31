import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        '/second page': (context) => SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("切換頁面"),
    );

    final btn = ElevatedButton(
      child: const Text("開啟第二頁"),
      onPressed: () => _showSecondPage(context),
    );

    final widget = Container(
      child: btn,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(30),
    );

    final page = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return page;
  }

  _showSecondPage(BuildContext context) async {
    final result =  await (Navigator.pushNamed(
      context,
      "/second page",
      arguments: SecondPageData(10, "顯示第二頁"),
    )) as FirstPageData;

    int num = result.num;
    String str = result.str;

    Fluttertoast.showToast(msg: '收到：$num, $str',);
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  SecondPageData? _data = null;

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      _data = ModalRoute.of(context)?.settings.arguments as SecondPageData;
      int num = _data!.num;
      String str = _data!.str;

      Fluttertoast.showToast(msg: '收到：$num, $str',);
    }

    final appBar = AppBar(
      title: const Text("第二頁"),
    );

    final btn = ElevatedButton(
      child: const Text("回到上一頁"),
      onPressed: () => Navigator.pop(context, FirstPageData(50, "回到第一頁")),
    );

    final widget = Container(
      child: btn,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(30),
    );

    final page = Scaffold(
      appBar: appBar,
      body: widget,
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
    );

    return page;
  }
}

class FirstPageData {
  int num;
  String str;

  FirstPageData(this.num, this.str);
}

class SecondPageData {
  int num;
  String str;

  SecondPageData(this.num, this.str);
}
