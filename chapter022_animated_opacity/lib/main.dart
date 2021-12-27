import 'dart:math';

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
      title: const Text("動畫範例"),
    );

    final animationWrapper =
        _AnimationWrapper(GlobalKey<_AnimationWrapperState>(), 1.0);

    var btn = ElevatedButton(
      child: const Text(
        "變透明",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        animationWrapper.setOpacity(0.0);
      },
    );

    final widget = Center(
      child: Container(
        child: Column(
          children: [
            animationWrapper,
            Container(
              child: btn,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  double _opacity;

  _AnimationWrapper(this._key, this._opacity) : super(key: _key);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  setOpacity(double opacity) {
    _key.currentState!.setOpacity(opacity);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = AnimatedOpacity(
      child: const Text(
        "Flutter 動畫",
        style: TextStyle(fontSize: 30),
      ),
      duration: const Duration(seconds: 1),
      opacity: widget._opacity,
      onEnd: () => setState(() {
        widget._opacity = 1.0;
      }),
    );
    return w;
  }

  setOpacity(double opacity) {
    setState(() {
      widget._opacity = opacity;
    });
  }
}
