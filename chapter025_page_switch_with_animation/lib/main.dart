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
      title: const Text("切換頁面"),
    );

    final btn = ElevatedButton(
      child: const Text("開啟第二頁"),
      onPressed: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const SecondPage(),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              //     SlideTransition(
              //   position: Tween(
              //     begin: const Offset(1, 0),
              //     end: Offset.zero,
              //   ).animate(animation),
              //   child: child,
              // ),
              // transitionDuration: const Duration(milliseconds: 300),
              // 縮放動畫
              // ScaleTransition(
              //   scale: Tween<double>(begin: 0.0, end: 1.0,).animate(
              //     CurvedAnimation(
              //         parent: animation, curve: Curves.fastOutSlowIn),),
              //   child: child,)
              // 縮放動畫
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: SizeTransition(
              //     sizeFactor: animation,
              //     child: child,
              //     axis: Axis.horizontal,
              //   ),
              // ),
              // 旋轉動畫
              RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.linear),
            ),
            child: child,
          ),
        ),
      ),
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
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("第二頁"),
    );

    final btn = ElevatedButton(
      child: const Text("回到上一頁"),
      onPressed: () => Navigator.pop(context),
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
